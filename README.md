# Apartment Scraper

A Python web scraper for apartments.com that extracts apartment listing information and saves it to Excel files.

## Requirements

- Python 3.8+
- Chrome browser installed
- Virtual environment (recommended)

## Setup

1. Clone the repository
2. Create and activate a virtual environment:
```bash
python -m venv .venv
# On Windows:
.venv\Scripts\activate
# On Unix/MacOS:
source .venv/bin/activate
```
3. Install dependencies:
```bash
pip install -r requirements.txt
```

## Usage

1. Run the script:
```bash
python apartment_scraper.py
```
2. When prompted, enter the apartments.com URL you want to scrape
3. The script will create an Excel file with the scraped data
4. If a file with the same name exists, it will create a new file with an incremented number

## Features

- Scrapes apartment unit information including:
  - Unit numbers
  - Square footage
  - Prices
  - Availability dates
- Automatically handles duplicate filenames
- Cleans and formats data before saving
- Headless browser operation

## Notes

- The script uses Chrome in headless mode
- Make sure you have a stable internet connection
- Some listings might require longer load times
- Excel files are saved in the same directory as the script