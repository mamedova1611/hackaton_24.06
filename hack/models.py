from django.contrib.auth.models import User
from django.db import models
from django.urls import reverse
from django.utils.translation import gettext_lazy as _



class Category(models.Model):
    name = models.CharField(max_length=100, db_index=True, verbose_name=_('наименование'))

    def __str__(self):
        return f"{self.name}"

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, verbose_name=_('пользователь'))
    phone = models.CharField(max_length=11, null=True, blank=True, verbose_name=_('телефон'))
    city = models.CharField(max_length=30, null=True, blank=True, verbose_name=_('город'))
    email = models.EmailField(null=True, blank=True, verbose_name=_('почта'))

class Business(models.Model):
    name = models.CharField(max_length=100, db_index=True, verbose_name=_('наименование'))
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='category',
                                 verbose_name=_('категория'))
    profile = models.ForeignKey(Profile, null=True, on_delete=models.CASCADE, related_name='profile',
                                 verbose_name=_('пользователь'))
    def __str__(self):
        return f"{self.name}"


class Service(models.Model):
    service_name = models.CharField(max_length=100, db_index=True, verbose_name=_('наименование'))
    service_price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name=_('цена'))
    business = models.ForeignKey(Business, on_delete=models.CASCADE, related_name='business_service',
                                 verbose_name=_('бизнес/деятельность'))
    def __str__(self):
        return f"{self.service_name}, {self.service_price}"

class Expense(models.Model):
    expense_name = models.CharField(max_length=100, db_index=True, verbose_name=_('наименование'))
    expense_price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name=_('цена'))
    business = models.ForeignKey(Business, on_delete=models.CASCADE, related_name='business_expense',
                                 verbose_name=_('бизнес/деятельность'))
    date = models.DateTimeField(verbose_name=_('дата'))

    def __str__(self):
        return f"{self.expense_name}, {self.expense_price}, {self.date}"




class Event(models.Model):
    business = models.ForeignKey(Business, on_delete=models.CASCADE, related_name='event_business',
                                 verbose_name=_('бизнес/деятельность'))
    service = models.ForeignKey(Service, on_delete=models.CASCADE,null=True, related_name='event_service', verbose_name=_('услуга'))
    expense = models.ForeignKey(Expense, on_delete=models.CASCADE,null=True, related_name='event_expence', verbose_name=_('платеж'))
    user = models.ForeignKey(Profile, on_delete=models.CASCADE)
    title = models.CharField(null=True, max_length=200, unique=True,verbose_name=_('описание'))
    complete = models.BooleanField(default=False)
    start_time = models.DateTimeField(verbose_name=_('начало'))
    end_time = models.DateTimeField(verbose_name=_('конец'))
    created_date = models.DateTimeField(auto_now_add=True,verbose_name=_('услуга'))

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('event-detail', args=(self.id,))

    @property
    def get_html_url(self):
        url = reverse('event-detail', args=(self.id,))
        # DATE_INPUT_FORMATS = ['%d-%m-%Y']
        if self.complete == False:
            return f'<p><b>{self.start_time.strftime("%H:%M")}</b><a href="{url}"> {self.title} </a></p>'
        else:
            return f'<strike><b>{self.start_time.strftime("%H:%M")}</b><a href="{url}"> {self.title} </a></strike>'
