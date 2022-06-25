from django.contrib.auth.forms import UserCreationForm
from django import forms
from django.forms import ModelForm, DateInput

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

class BusinessForm(ModelForm):
    class Meta:
        model= Business
        fields = ['name', 'category']

class ServiceForm(ModelForm):
    class Meta:
        model = Service
        fields = ['service_name', 'service_price']

class ExpenseForm(ModelForm):

    class Meta:
        model = Expense

        widgets = {
            'date': DateInput(attrs={'type': 'datetime-local'}, format='%Y-%m-%d'),
        }
        exclude = ['business']

    def __init__(self, *args, **kwargs):
        super(ExpenseForm, self).__init__(*args, **kwargs)

        self.fields['date'].input_formats = ('%Y-%m-%d',)

class EventForm(ModelForm):
    class Meta:
        model = Event

        widgets = {
            'start_time': DateInput(attrs={'type': 'datetime-local'}, format='%Y-%m-%dT%H:%M'),
            'end_time': DateInput(attrs={'type': 'datetime-local'}, format='%Y-%m-%dT%H:%M'),
        }
        exclude = ['user', 'expense', 'complete']

    def __init__(self, *args, **kwargs):
        super(EventForm, self).__init__(*args, **kwargs)

        self.fields['start_time'].input_formats = ('%Y-%m-%dT%H:%M',)
        self.fields['end_time'].input_formats = ('%Y-%m-%dT%H:%M',)

