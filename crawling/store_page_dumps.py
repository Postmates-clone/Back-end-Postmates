import os
from selenium import webdriver

from .store_detail import get_store_detail
from .stores_url import get_all_nearby_store_url, search_by_location

root_dir = os.path.dirname(os.path.abspath(__file__))

url = 'https://postmates.com/'

options = webdriver.ChromeOptions()
options.add_argument('headless')
options.add_argument('window-size=1920x1080')
options.add_argument("disable-gpu")

driver = webdriver.Chrome(f'{root_dir}/chromedriver', options=options)

cities_urls = {
    'San Francisco': [],
    'New York': [],
    'Los angeles': []
}

TIME_OUT = 3

for city, urls in cities_urls.items():
    # main page 검색을 위한
    driver.get(url)

    # 도시 검색 -> Feed page
    search_by_location(driver, city)

    # nearby 가게 url 추출
    stores_url = get_all_nearby_store_url(driver, TIME_OUT)

    urls.extend(stores_url)

for city, urls in cities_urls.items():
    os.makedirs(f'{root_dir}/{city}', exist_ok=True)
    for url in urls:
        store_json = get_store_detail(url)

        try:      
            with open(f'{root_dir}/{city}/{url[31:]}.json', 'w') as f:
                f.write(store_json)
        except TypeError:
            print(store_json)