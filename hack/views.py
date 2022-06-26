import calendar
import math
import os
from calendar import HTMLCalendar
from datetime import datetime, date
from datetime import timedelta
import matplotlib.pyplot as plt
import matplotlib.pyplot as plt1
import matplotlib.pyplot as plt2
import numpy as np

from django.contrib.auth import authenticate, login
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.views import LoginView, LogoutView
from django.db.models import Count
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from django.utils.safestring import mark_safe
from django.views import View
from django.views.generic import UpdateView, ListView, DetailView
from openpyxl import Workbook
from openpyxl.writer.excel import save_virtual_workbook

from hackathon.settings import BASE_DIR
from .forms import *

def index(request):
    return render(request, 'main.html')

def register_view(request):
    if request.method == 'POST':
        form = ProfileForm(request.POST)
        if form.is_valid():
            user = form.save()
            phone = form.cleaned_data.get('phone')
            city = form.cleaned_data.get('city')
            email = form.cleaned_data.get('email')
            profile_user = Profile.objects.create(
                id=user.id,
                user=user,
                phone=phone,
                city=city,
                email=email
            )
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(request, username=username, password=raw_password)
            login(request, user)
            return render(request, 'profile.html', {'user': profile_user})
    else:
        form = ProfileForm()
    return render(request, 'register.html', {'form': form})


class UserLoginView(LoginView):
    template_name = 'login.html'


class UserLogoutView(LogoutView):
    template_name = 'logout.html'


class ProfileDetailView(DetailView):
    model = Profile
    template_name = 'profile.html'
    context_object_name = 'user'
    pk_url_kwarg = 'pk'


class ProfileEditFormView(UpdateView):
    model = Profile
    template_name = 'profile_edit.html'
    fields = '__all__'


class BusinessListView(ListView):
    model = Business
    template_name = 'businesses_list.html'
    context_object_name = 'businesses'


class BusinessDetailView(DetailView):
    model = Business
    template_name = 'businesses.html'
    context_object_name = 'business'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        business_object = self.get_object()
        context['services'] = business_object.business_service.all()
        context['service_form'] = ServiceForm()
        context['expenses'] = business_object.business_expense.all()
        context['expense_form'] = ExpenseForm()
        return context

    def post(self, request, pk):
        profile = Profile.objects.get(user=self.request.user)
        business = Business.objects.get(pk=pk)
        service_form = ServiceForm(request.POST)
        expense_form = ExpenseForm(request.POST)
        if not service_form.is_valid() and expense_form.is_valid():
            form = expense_form.save(commit=False)
            form.business = business
            form.save()
            expense = Expense.objects.filter(business=business).latest('id')
            Event.objects.create(business=business, expense=expense, user=profile,
                                 start_time=expense.date, end_time=expense.date)
            return HttpResponseRedirect(reverse('business_detail', args=[pk]))
        if service_form.is_valid() and not expense_form.is_valid():
            form = service_form.save(commit=False)
            form.business = business
            form.save()
            return HttpResponseRedirect(reverse('business_detail', args=[pk]))
        if expense_form.is_valid() and service_form.is_valid():
            service = service_form.save(commit=False)
            service.business = business
            service.save()
            expense = expense_form.save(commit=False)
            expense.business = business
            expense.save()
            return HttpResponseRedirect(reverse('business_detail', args=[pk]))
        return render(request, 'businesses.html', {'service_form': service_form, 'expense_form': expense_form})


def create_business(request):
    if request.method == 'POST':
        form = BusinessForm(request.POST)
        if form.is_valid():
            business = form.save(commit=False)
            profile = Profile.objects.get(user=request.user)
            business.profile = profile
            business.save()
            Expense.objects.create(
                expense_name='НАЛОГ', expense_price=3063, date=datetime.today(), business=business
            )

            return render(request, 'profile.html', {'user': profile})
    else:
        form = BusinessForm()
    return render(request, 'business_create.html', {'form': form})


class BusinessEditView(UpdateView):
    model = Business
    template_name = 'business_edit.html'
    fields =  ['name', 'category']



# class BusinnessDeleteView(View):
#     def post(self, request, pk):
#         business = Business.objects.filter(pk=pk).delete()
#         return render(request, 'profile.html', {'user': self.request.user})


class Calendar(HTMLCalendar):
    def __init__(self, year=None, month=None):
        self.year = year
        self.month = month
        super(Calendar, self).__init__()

    def formatday(self, day, events):
        events_per_day = events.filter(start_time__day=day)
        d = ''

        for event in events_per_day:
            d += f'<li> {event.get_html_url} </li>'

        if day != 0:
            return f"<td><span class='date'>{day}</span><ul> {d} </ul></td>"
        return '<td></td>'

    def formatweek(self, theweek, events):
        week = ''
        for d, weekday in theweek:
            week += self.formatday(d, events)
        return f'<tr> {week} </tr>'

    def formatmonth(self, withyear=True):
        events = Event.objects.filter(start_time__year=self.year, start_time__month=self.month)

        cal = f'<table border="0" cellpadding="0" cellspacing="0" class="calendar">\n'
        cal += f'{self.formatmonthname(self.year, self.month, withyear=withyear)}\n'
        cal += f'{self.formatweekheader()}\n'
        for week in self.monthdays2calendar(self.year, self.month):
            cal += f'{self.formatweek(week, events)}\n'
        return cal


def get_date(req_day):
    if req_day:
        year, month = (int(x) for x in req_day.split('-'))
        return date(year, month, day=1)
    return datetime.today()


def prev_month(d):
    first = d.replace(day=1)
    prev_month = first - timedelta(days=1)
    month = 'month=' + str(prev_month.year) + '-' + str(prev_month.month)
    return month


def next_month(d):
    days_in_month = calendar.monthrange(d.year, d.month)[1]
    last = d.replace(day=days_in_month)
    next_month = last + timedelta(days=1)
    month = 'month=' + str(next_month.year) + '-' + str(next_month.month)
    return month


class CalendarView(LoginRequiredMixin, ListView):
    model = Event
    template_name = 'calendar.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        d = get_date(self.request.GET.get('month', None))
        cal = Calendar(d.year, d.month)
        html_cal = cal.formatmonth(withyear=True)
        context['calendar'] = mark_safe(html_cal)
        context['prev_month'] = prev_month(d)
        context['next_month'] = next_month(d)
        return context


def create_event(request):
    form = EventForm(request.POST or None)
    if form.is_valid():
        business = form.cleaned_data['business']
        service = form.cleaned_data['service']
        title = form.cleaned_data['title']
        start_time = form.cleaned_data['start_time']
        end_time = form.cleaned_data['end_time']
        event = form.save(commit=False)
        user = Profile.objects.get(user=request.user)
        event.user = user
        event.business = business
        event.service = service
        event.title = title
        event.start_time = start_time
        event.end_time = end_time
        event.save()
        return HttpResponseRedirect(reverse('calendar'))
    return render(request, 'event.html', {'form': form})


class EventEdit(UpdateView):
    model = Event
    template_name = 'event.html'
    fields = ['business', 'service', 'title', 'start_time', 'end_time']


def event_details(request, pk):
    event = Event.objects.get(id=pk)
    return render(request, 'event-details.html', {'event': event})


class ReportView(View):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.report_income, self.report_expenses = [], []
        self.total_income, self.total_expense = 0, 0
        self.total = 0
        self.count = 1

    def kalculator(self):
        event = Event.objects.select_related('service', 'user', 'expense')
        top_service = event.values('service__service_name').annotate(num=Count('service'))
        top_expense = event.values('expense__expense_name').annotate(num=Count('expense'))

        for service in top_service:
            list_income = {}
            service_name_event = service['service__service_name']
            if not service_name_event is None:
                s = Service.objects.get(service_name=service_name_event)
                if s.service_name == service_name_event:
                    list_income['name'] = service_name_event
                    list_income['summa'] = s.service_price * service['num']
                    self.total_income += list_income['summa']
                self.report_income.append(list_income)
        for expense in top_expense:
            list_expense = {}
            expense_name_event = expense['expense__expense_name']
            if not expense_name_event is None:
                e = Expense.objects.get(expense_name=expense_name_event)
                if e.expense_name == expense_name_event:
                    list_expense['name'] = expense_name_event
                    list_expense['summa'] = e.expense_price * expense['num']
                    self.total_expense += list_expense['summa']
                self.report_expenses.append(list_expense)
        self.total = self.total_income - self.total_expense

    def get(self, request, pk):
        self.kalculator()
        percent_exp = self.total_expense * 100 / self.total_income
        percent_profit = abs(self.total * 100 / self.total_income)
        y = np.array([percent_exp, percent_profit])
        mylabels = ["Убыток", "Прибыль"]
        myexplode = [0.2, 0]
        plt.figure()
        plt.pie(y, labels=mylabels, explode=myexplode)
        plt.savefig(os.path.join(BASE_DIR, 'hack', 'static', 'img', 'pie_chart%s.png' % self.count))
        mylabels1 = []
        percents = []
        for i in self.report_income:
            if not i is None:
                for name, summa in i.items():
                    if name == 'name':
                        mylabels1.append(summa)
                    elif name == 'summa':
                        percents.append((summa * 100) / self.total_income)
        plt.figure()
        plt.pie(np.array(percents), labels=mylabels1)
        plt.savefig(os.path.join(BASE_DIR, 'hack', 'static', 'img', 'pie_chart_income%s.png' % self.count))
        mylabels2 = []
        percents2 = []
        for i in self.report_expenses:
            if not i is None:
                for name, summa in i.items():
                    if name == 'name':
                        mylabels2.append(summa)
                    elif name == 'summa':
                        percents2.append((summa * 100) / self.total_expense)
        plt.figure()
        plt.pie(np.array(percents2), labels=mylabels2)
        plt.savefig(os.path.join(BASE_DIR, 'hack', 'static', 'img', 'pie_chart_exp%s.png' % self.count))
        path_chart = '/hack/static/img/pie_chart%s.png' % self.count
        path_chart_i = '/hack/static/img/pie_chart_income%s.png' % self.count
        path_chart_e = '/hack/static/img/pie_chart_exp%s.png' % self.count
        self.count += 1
        return render(request, 'report.html', {'income': self.report_income, 'total_income': self.total_income,
                                               'expense': self.report_expenses, 'total_expense': self.total_expense,
                                               'total': self.total, 'path_img': path_chart, 'path_img_income': path_chart_i,
                                               'path_img_exp': path_chart_e})

    def post(self, request, pk):
        self.kalculator()
        workbook = Workbook()
        worksheet = workbook.active
        worksheet['A1'] = 'ДОХОДЫ'
        worksheet['A2'] = 'СТАТЬИ'
        worksheet['B2'] = 'СУММА'
        worksheet['D1'] = 'РАСХОДЫ'
        worksheet['D2'] = 'СТАТЬИ'
        worksheet['E2'] = 'СУММА'
        count = 3
        for i in self.report_income:
            if not i is None:
                for name, summa in i.items():
                    if name == 'name':
                        num_cell = 'A%s' % count
                        worksheet[num_cell] = summa
                    elif name == 'summa':
                        num_cell = 'B%s' % count
                        worksheet[num_cell] = summa
                        count += 1
        num_cell = 'A%s' % count
        worksheet[num_cell] = 'ИТОГО'
        num_cell = 'B%s' % count
        worksheet[num_cell] = self.total_income
        count = 3
        for i in self.report_expenses:
            if not i is None:
                for name, summa in i.items():
                    if name == 'name':
                        num_cell = 'D%s' % count
                        worksheet[num_cell] = summa
                    elif name == 'summa':
                        num_cell = 'E%s' % count
                        worksheet[num_cell] = summa
                        count += 1
        num_cell = 'D%s' % count
        worksheet[num_cell] = 'ИТОГО'
        num_cell = 'E%s' % count
        worksheet[num_cell] = self.total_expense
        worksheet['G1'] = 'ПРИБЫЛЬ'
        worksheet['H1'] = self.total
        response = HttpResponse(content=save_virtual_workbook(workbook),
                                content_type='application/ms-excel')
        response['Content-Disposition'] = 'attachment; filename=myexport.xlsx'
        return response

