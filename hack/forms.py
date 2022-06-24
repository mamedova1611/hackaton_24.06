from django.contrib.auth.forms import UserCreationForm
from django import forms
from .models import *

class AuthForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput)

class ProfileForm(UserCreationForm):
    phone = forms.CharField(max_length=11, required=False, help_text='телефон')
    city = forms.CharField(max_length=30, required=False, help_text='город')
    email = forms.EmailField(required=False,help_text='почта')

    class Meta:
        model = User
        fields = ['username', 'phone', 'city', 'email', 'password1', 'password2']