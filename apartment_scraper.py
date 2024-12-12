from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
import pandas as pd
import time
import os

class ApartmentScraper:
    def __init__(self):
        # Initialize Chrome options
        options = webdriver.ChromeOptions()
        options.add_argument('--headless')  # Run in headless mode
        options.add_argument('--disable-gpu')
        options.add_argument('--no-sandbox')
        options.add_argument('--disable-dev-shm-usage')
        # Add these options to make the browser look more like a real user
        options.add_argument('--window-size=1920,1080')
        options.add_argument('user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36')
        
        # Initialize the driver
        self.driver = webdriver.Chrome(options=options)
        
    def scrape_listing(self, url):
        try:
            self.driver.get(url)
            WebDriverWait(self.driver, 20).until(
                EC.presence_of_element_located((By.CLASS_NAME, "js-unitContainerV3"))
            )
            
            time.sleep(5)
            
            print("Page title:", self.driver.title)
            print("Current URL:", self.driver.current_url)
            
            units = self.driver.find_elements(By.CLASS_NAME, "js-unitContainerV3")
            
            units_data = []
            for unit in units:
                try:
                    unit_data = {
                        'unit_number': self._get_text(unit, ".unitColumn.column"),
                        'sq_ft': self._get_text(unit, ".sqftColumn.column span:nth-child(2)"),
                        'price': self._get_text(unit, ".pricingColumn.column .screenReaderOnly + span"),
                        'availability': self._get_text(unit, "span.dateAvailable")
                    }
                    units_data.append(unit_data)
                    print(f"Scraped unit data: {unit_data}")
                except Exception as e:
                    print(f"Error scraping unit: {e}")
                    continue
            
            return units_data
            
        except TimeoutException:
            print("Timeout waiting for page to load")
            print("Page source:", self.driver.page_source)
            return []
        except Exception as e:
            print(f"Error scraping listing: {e}")
            return []
    
    def _get_text(self, element, selector):
        """Helper method to safely get text from an element"""
        try:
            text = element.find_element(By.CSS_SELECTOR, selector).text.strip()
            # Clean availability text if it's the availability field
            if selector == "span.dateAvailable":
                return text.replace("Availability\n", "")
            return text
        except:
            return ""
    
    def _clean_data(self, data):
        """Clean scraped data before saving"""
        for unit in data:
            if 'availability' in unit:
                unit['availability'] = unit['availability'].replace("Availability\n", "")
        return data
    
    def save_to_excel(self, data, output_file):
        """Save the scraped data to an Excel file"""
        # Clean data before creating DataFrame
        cleaned_data = self._clean_data(data)
        df = pd.DataFrame(cleaned_data)
        
        # Clean the availability column by removing the word "availability" from all cells
        if 'availability' in df.columns:
            df['availability'] = df['availability'].str.replace('availibility\n', '', case=False).str.strip()
        
        # Handle duplicate filenames
        base_name = os.path.splitext(output_file)[0]
        extension = os.path.splitext(output_file)[1]
        counter = 1
        final_output_file = output_file
        
        while os.path.exists(final_output_file):
            final_output_file = f"{base_name}_{counter}{extension}"
            counter += 1
            
        df.to_excel(final_output_file, index=False)
        print(f"Data saved to {final_output_file}")
    
    def close(self):
        """Close the browser"""
        self.driver.quit()

def main():
    # Get URL from user input
    url = input("Enter the apartments.com listing URL to scrape: ").strip()
    
    if not url:
        print("No URL provided. Using default URL...")
        url = "https://www.apartments.com/post-chicago-il/bdv81bb/"
    elif not url.startswith("https://www.apartments.com/"):
        print("Invalid URL. Please provide a valid apartments.com URL.")
        return
    
    # Initialize scraper
    scraper = ApartmentScraper()
    
    try:
        # Scrape the listing
        print(f"Scraping {url}...")
        units_data = scraper.scrape_listing(url)
        
        if units_data:
            # Save to Excel
            output_file = "apartment_listings.xlsx"
            scraper.save_to_excel(units_data, output_file)
        else:
            print("No data was scraped")
            
    finally:
        # Clean up
        scraper.close()

if __name__ == "__main__":
    main() 