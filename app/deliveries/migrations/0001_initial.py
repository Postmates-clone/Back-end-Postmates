# Generated by Django 3.0.8 on 2020-07-16 06:57

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('stores', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Delivery',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ordered_date', models.DateTimeField(auto_now_add=True)),
                ('total_price', models.FloatField()),
            ],
        ),
        migrations.CreateModel(
            name='OrderedMenu',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('delivery', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='ordered_menus', to='deliveries.Delivery')),
                ('menu', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='ordered_menus', to='stores.Menu')),
                ('options', models.ManyToManyField(related_name='ordered_menus', to='stores.Option')),
            ],
        ),
        migrations.AddField(
            model_name='delivery',
            name='items',
            field=models.ManyToManyField(related_name='delivery', through='deliveries.OrderedMenu', to='stores.Menu'),
        ),
        migrations.AddField(
            model_name='delivery',
            name='store',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='deliveries', to='stores.Store'),
        ),
    ]
