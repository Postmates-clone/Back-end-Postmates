import time
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.keys import Keys


def search_by_location(driver, location):
    """
    검색 도시 입력

    Args:
        driver (object): chromedriver
        location (string): 도시이름
    Returns:
        string: current url
    """

    try:
        input_box = WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.CSS_SELECTOR, ".geosuggest__input"))
        )

        driver.execute_script(f"arguments[0].value = '{location}';", input_box)
        input_box.send_keys(Keys.CONTROL + "a")
        input_box.send_keys(Keys.DELETE)
        input_box.send_keys(location)

        driver.find_element_by_class_name('css-um3ari').click()

        WebDriverWait(driver, 10).until(
            lambda d: d.current_url == "https://postmates.com/feed"
        )
    except:
        return None

    return driver.current_url


def get_all_nearby_store_url(driver, timeout):
    """
    무한 스크롤을 통한 모든 store url 추출

    Args:
        driver (object): chromedriver
        timeout (int): loading 기다릴 시간
    Returns:
        None
    """

    scroll_pause_time = timeout

    ret = []

    while True:
        div_nearby_stores = driver.find_elements_by_xpath("//div[@class='css-19f3h52 e12wrbia0']/a")
        #         print("count :", len(div_nearby_stores))

        # 랜더링 된 가게 url 추출
        ret.extend([i.get_attribute('href') for i in div_nearby_stores])

        # 맨 아래로 스크롤 내리기
        driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")

        # 랜더링 된 후 body 높이
        last_height = driver.execute_script("return document.body.scrollHeight")

        # 랜더링 기다리기
        time.sleep(scroll_pause_time)
        # 맨 위로 스크롤 올리기
        driver.execute_script("window.scrollTo(0, 0);")

        # document 스크롤 높이 다시 계산
        new_height = driver.execute_script("return document.body.clientHeight")
        if new_height == last_height:
            # document 스크롤 높이 변동 없을 시 loop 탈출
            break

        last_height = new_height

    return set(ret)
