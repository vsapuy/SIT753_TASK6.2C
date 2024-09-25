from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import time

def test_webpage():
    # Set up Chrome WebDriver
    options = webdriver.ChromeOptions()
    options.add_argument("--headless")  # Run in headless mode
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")
    
    # Specify the path to chromedriver
    service = Service('/usr/local/bin/chromedriver')
    driver = webdriver.Chrome(service=service, options=options)

    try:
        # Navigate to the local web server
        driver.get("http://localhost:5001")
        time.sleep(2)  # Wait for page to load
        
        # Check that the title or a key element is present on the page
        assert "dBm Calculator" in driver.title

        # Interact with the page if necessary
        input_field = driver.find_element(By.NAME, "mw")
        input_field.send_keys("100")
        submit_button = driver.find_element(By.NAME, "calculate")
        submit_button.click()

        # Check the result
        result = driver.find_element(By.ID, "result")
        assert "20 dBm" in result.text

    finally:
        driver.quit()

if __name__ == "__main__":
    test_webpage()
