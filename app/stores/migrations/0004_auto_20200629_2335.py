# Generated by Django 3.0.7 on 2020-06-29 14:35

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('stores', '0003_auto_20200629_2321'),
    ]

    operations = [
        migrations.AlterField(
            model_name='menu',
            name='store',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='menus', to='stores.Store'),
        ),
    ]
