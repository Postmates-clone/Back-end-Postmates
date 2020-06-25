from bs4 import BeautifulSoup
from selenium import webdriver
import time
import csv

url = 'https://postmates.com/'
driver = webdriver.Chrome('./chromedriver')
driver.get(url)

article = driver.find_element_by_class_name('geosuggest__input')
keyword = '센프란시스코'
article.send_keys(keyword)
driver.find_element_by_class_name('css-um3ari').click()



SCROLL_PAUSE_TIME = 2
last_height = driver.execute_script("return document.body.scrollHeight")


for i in range(10):
    driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
    
    time.sleep(SCROLL_PAUSE_TIME)
    
    driver.execute_script("window.scrollTo(0, document.body.scrollHeight -50);")
    new_height = driver.execute_script("return document.body.scrollHeight")
    
    print('last_hight :  ' + str(last_height))
    print('new_height  :  ' + str(new_height))


    last_height = new_height
    
div_css_26574z = driver.find_element_by_class_name('css-26574z')
div_nearby = div_css_26574z.find_elements_by_class_name('css-19f3h52')

image_list = list()
name_list = list()
url_list = list()
data = {}
for restaurant_div in div_nearby:
    a_tag = restaurant_div.find_element_by_tag_name('a')
    print(a_tag.get_attribute('href'))
    url_list.append(a_tag.get_attribute('href'))
    
    
    div_tag = restaurant_div.find_element_by_tag_name('div')
#     print(div_tag.get_attribute('class'))
    

    try:
        name_list.append(div_tag.find_element_by_tag_name('div').find_element_by_tag_name('div').get_attribute('title'))
        print(div_tag.find_element_by_tag_name('div').find_element_by_tag_name('div').get_attribute('title'))
    except:
        print('error')
        
    try:
        image_list.append(div_tag.find_element_by_tag_name('div').find_element_by_tag_name('img').get_attribute('src'))
#         print(div_tag.find_element_by_tag_name('div').find_element_by_tag_name('img').get_attribute('src'))
        
    except:
        print('eerrr1111')
data = {
    
}
for name, image, url in zip(name_list, image_list, url_list):
    rs_name = name
    data[rs_name] = url
    rs_image = 'image__'+ name 
    data[rs_image] = image
    rs_url =  'url__' + name
    data[rs_url] = url

print(url_list)
