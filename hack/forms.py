from django.contrib.auth.forms import UserCreationForm
from django import forms
from django.forms import ModelForm

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


class ServiceForm(ModelForm):
    class Meta:
        model = Service
        fields = ['name', 'price']

class ExpenseForm(ModelForm):
    class Meta:
        model = Expense
        fields = ['name','price', 'date']
#
# class PlanForm(ModelForm):
#     class Meta:
#         model = Plan
#         fields = ['event', 'service', 'datetime']

