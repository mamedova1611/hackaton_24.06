from django.contrib.auth import authenticate, login
from django.contrib.auth.views import LoginView, LogoutView
from django.shortcuts import render
from django.views import generic, View
from django.views.generic import UpdateView
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

class ProfileDetailView(generic.DetailView):
    model = Profile
    template_name = 'profile.html'
    context_object_name = 'user'
    pk_url_kwarg = 'pk'

class ProfileEditFormView(UpdateView):
    model = Profile
    template_name = 'profile_edit.html'
    fields = '__all__'