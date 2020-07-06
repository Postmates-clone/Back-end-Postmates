import json

import requests


def get_store_detail(url):
    res = requests.post(url).json()
    data_place = res['data'].get('place', None)

    if not data_place:
        print(res['data'])
        return

    store = {
        "url": url,
        "name": data_place['name'],
        "description": res['description'],
        "store_img": data_place['header_img']['original_url'],
        "delivery_time": '',
        "open_hours": data_place['place_hours']['hours'] if data_place.get('place_hours', None) else None,
        "is_delivery": data_place['active'],
        "is_pickup": data_place.get('is_pickup_enabled', False),
        "delivery_fee": data_place['delivery_fee_badge'].split()[0][1:] if data_place.get('delivery_fee_badge', False) else None,
        "estimated_prep_time": data_place['estimated_prep_time'],
        "is_partner": data_place.get('is_partner', False),
        "address": data_place['street_address_1'],
        "lat": data_place['lat'],
        "lng": data_place['lng'],
        "store_type": data_place['primary_place_category']['name'],
        "city": data_place['city'],
        "badges": data_place.get('badges', None),
        "all_menus": []
    }

    if not data_place.get('catalog', None) or not data_place['catalog'].get('categories', None):
        return json.dumps(store)

    all_menus = []

    for menu_category in data_place['catalog']['categories']:
        category_dict = {}
        category_dict['category'] = menu_category['name']
        category_dict['menus'] = []
        
        if not menu_category.get('products', None):
            continue

        for menu in menu_category.get('products'):
            menu_dict = {}
            menu_dict['name'] = menu['name']

            menu_dict['img_url'] = menu['img'].get('orignal_url', None) if menu.get('img', False) else None

            menu_dict['description'] = menu.get('description', None)
            menu_dict['base_price'] = menu['base_price']

            menu_dict['option_groups'] = []
            for option_category in menu['option_groups']:
                option_category_dict = {}
                option_category_dict['category'] = option_category['name']
                option_category_dict['is_required'] = option_category.get('single', None)

                option_category_dict['options'] = []
                for option in option_category['options']:
                    option_dict = {}
                    option_dict['name'] = option['name']
                    option_dict['price'] = option['price']
                    option_category_dict['options'].append(option_dict)

                menu_dict['option_groups'].append(option_category_dict)

            category_dict['menus'].append(menu_dict)
        all_menus.append(category_dict)

    store['all_menus'] = all_menus

    return json.dumps(store)
