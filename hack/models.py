from django.contrib.auth.models import User
from django.db import models
from django.utils.translation import gettext_lazy as _


class Category(models.Model):
    name = models.CharField(max_length=100, db_index=True, verbose_name=_('наименование'))

    def __str__(self):
        return f"{self.name}"


class Business(models.Model):
    name = models.CharField(max_length=100, db_index=True, verbose_name=_('наименование'))
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='category',
                                 verbose_name=_('категория'))
    def __str__(self):
        return f"{self.name}"

class Service(models.Model):
    name = models.CharField(max_length=100, db_index=True, verbose_name=_('наименование'))
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name=_('цена'))
    business = models.ForeignKey(Business, on_delete=models.CASCADE, related_name='business_service',
                                 verbose_name=_('бизнес/деятельность'))
    def __str__(self):
        return f"{self.name}, {self.price}"

class Expense(models.Model):
    name = models.CharField(max_length=100, db_index=True, verbose_name=_('наименование'))
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name=_('цена'))
    business = models.ForeignKey(Business, on_delete=models.CASCADE, related_name='business_expense',
                                 verbose_name=_('бизнес/деятельность'))
    date = models.DateField(verbose_name=_('дата'))

    def __str__(self):
        return f"{self.name}, {self.price}, {self.date}"

class Plan(models.Model):
    business = models.ForeignKey(Business, on_delete=models.CASCADE, related_name='business_plan',
                                 verbose_name=_('бизнес/деятельность'))
    event = models.CharField(max_length=100, db_index=True, verbose_name=_('событие'))
    service = models.ForeignKey(Service, on_delete=models.CASCADE, related_name='service', verbose_name=_('услуга'))
    datetime = models.DateTimeField(verbose_name=_('дата'))

    def __str__(self):
        return f"{self.event}, {self.service}, {self.datetime}"

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, verbose_name=_('пользователь'))
    phone = models.CharField(max_length=11, null=True, blank=True, verbose_name=_('телефон'))
    city = models.CharField(max_length=30, null=True, blank=True, verbose_name=_('город'))
    email = models.EmailField(null=True, blank=True, verbose_name=_('почта'))
    business = models.ForeignKey(Business, null=True, on_delete=models.CASCADE, related_name='business_profile',
                                 verbose_name=_('бизнес/деятельность'))
