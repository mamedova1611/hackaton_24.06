from django.contrib.auth import authenticate, login
from django.contrib.auth.views import LoginView, LogoutView
from django.views.generic import UpdateView, CreateView, ListView, DetailView
from calendar import HTMLCalendar
from .models import *
from .forms import *


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
        business = Business.objects.get(pk=pk)
        service_form = ServiceForm(request.POST)
        expense_form = ExpenseForm(request.POST)
        if not service_form.is_valid() and expense_form.is_valid():
            form = expense_form.save(commit=False)
            form.business = business
            form.save()
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


class BusinessCreateView(CreateView):
    model = Business
    template_name = 'business_create.html'
    fields = '__all__'

    def get_success_url(self):
        return self.request.META.get('HTTP_REFERER')

    def get(self, request, *args, **kwargs):
        expence = Expense.objects.create(
            expense_name='НАЛОГ', expense_price=3063, date=datetime.today()
        )
        return render(request, 'profile.html', {'user': request.user})

def create_business(request):
    if request.method == 'POST':
        form = BusinessForm(request.POST)
        if form.is_valid():
            business = form.save()
            Expense.objects.create(
                expense_name='НАЛОГ', expense_price=3063, date=datetime.today(), business=business
            )
            return render(request, 'profile.html', {'user': request.user})
    else:
        form = BusinessForm()
    return render(request, 'business_create.html', {'form': form})

class BusinessEditView(UpdateView):
    model = Business
    template_name = 'business_edit.html'
    fields = '__all__'

    def get_success_url(self):
        return self.request.META.get('HTTP_REFERER')


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


from datetime import datetime, date
from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.views import generic
from django.utils.safestring import mark_safe
from datetime import timedelta
import calendar
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin


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


class CalendarView(LoginRequiredMixin, generic.ListView):
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


class EventEdit(generic.UpdateView):
    model = Event
    template_name = 'event-details.html'
    fields = '__all__'
