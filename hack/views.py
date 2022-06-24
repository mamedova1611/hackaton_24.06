from django.contrib.auth import authenticate, login
from django.contrib.auth.views import LoginView, LogoutView
from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect
from django.urls import reverse
from django.views import View
from django.views.generic import UpdateView, CreateView, ListView, DetailView, DeleteView
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

    def post(self,request, pk):
        business = Business.objects.get(pk=pk)
        service_form = ServiceForm(request.POST)
        expense_form = ExpenseForm(request.POST)
        if service_form.is_valid() or expense_form.is_valid():
            service = service_form.save(commit=False)
            service.business = business
            service.save()
            expense = expense_form.save(commit=False)
            expense.business = business
            expense.save()
            return HttpResponseRedirect(reverse('business_detail', args=[pk]))

        return render(request, 'businesses.html', {'service_form': service_form,'expense_form': expense_form})

class BusinessCreateView(CreateView):
    model = Business
    template_name = 'business_create.html'
    fields = '__all__'

    def get_success_url(self):
        return self.request.META.get('HTTP_REFERER')

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
