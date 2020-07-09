import json

import requests


def get_data(data, fields):
    if len(fields) == 1:
        return data.get(fields[0], False)
    if fields and data.get(fields[0], False):
        return get_data(data[fields[0]], fields[1:])


def get_store_detail(url):
    res = requests.post(url).json()
    data_place = res['data'].get('place', None)

    store = {
        "url": url,
        "description": res['description'],
    }

    if not data_place:
        return json.dumps(store)

    store.update({
        "name": get_data(data_place, ['name']),
        "store_img": get_data(data_place, ['header_img', 'original_url']),
        "delivery_message": get_data(data_place, ['hours', 'delivery_message']),
        "last_order_time": get_data(data_place, ['hours', 'last_order_time']),
        "open_hours": get_data(data_place, ['place_hours', 'hours']),
        "is_delivery": get_data(data_place, ['active']),
        "is_pickup": get_data(data_place, ['is_pickup_enables']),
        "delivery_fee":
            data_place['delivery_fee_badge'].split()[0][1:] if data_place.get('delivery_fee_badge', False) else None,
        "estimated_prep_time": get_data(data_place, ['estimated_prep_time']),
        "is_partner": get_data(data_place, ['is_partner']),
        "address": get_data(data_place, ['street_address_1']),
        "lat": get_data(data_place, ['lat']),
        "lng": get_data(data_place, ['lng']),
        "store_type": get_data(data_place, ['primary_place_category', 'name']),
        "city": get_data(data_place, ['city']),
        "badges": get_data(data_place, ['badges']),
        "all_menus": []
    })

    if not data_place.get('catalog', None) or not data_place['catalog'].get('categories', None):
        return json.dumps(store)

    all_menus = []

    for menu_category in data_place['catalog']['categories']:
        category_dict = {
            'category': menu_category['name'],
            'menus': []
        }

        if not menu_category.get('products', None):
            continue

        for menu in menu_category.get('products'):
            menu_dict = {
                'name': get_data(menu, ['name']),
                'img_url': get_data(menu, ['img', 'original_url']),
                'description': get_data(menu, ['description']),
                'base_price': get_data(menu, ['base_price']),
                'option_groups': []
            }

            for option_category in menu['option_groups']:
                option_category_dict = {
                    'category': get_data(option_category, ['name']),
                    'is_required': get_data(option_category, ['single']),
                    'options': []
                }

                for option in option_category['options']:
                    option_dict = {
                        'name': get_data(option, ['name']),
                        'price': get_data(option, ['price']),
                    }
                    option_category_dict['options'].append(option_dict)

                menu_dict['option_groups'].append(option_category_dict)

            category_dict['menus'].append(menu_dict)
        all_menus.append(category_dict)

    store['all_menus'] = all_menus

    return json.dumps(store)
