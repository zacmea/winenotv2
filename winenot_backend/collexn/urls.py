#these are all prefixed with /collexns/

from django.urls import path

from . import api

urlpatterns = [
    path('', api.collexn_list, name='collexn_list'),
    path('create/', api.collexn_create, name='collexn_create'),
    path('<pk>/', api.collexn_detail, name='collexn_detail'),
    path('<pk>/delete/', api.collexn_delete, name='collexn_delete'),
    path('<collpk>/remove_wine/<winepk>/', api.remove_wine_from_collexn, name='remove_wine_from_collexn'),
    path('<collpk>/add_wines/', api.add_wines_to_collexn, name='add_wines_to_collexn'),

]