# Generated by Django 5.0.6 on 2024-06-07 21:08

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='winecollection',
            name='wines',
        ),
        migrations.RemoveField(
            model_name='winecollection',
            name='user',
        ),
        migrations.DeleteModel(
            name='Wine',
        ),
        migrations.DeleteModel(
            name='WineCollection',
        ),
    ]
