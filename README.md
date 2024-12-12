# Apartment Scraper

A Python web scraper for apartments.com that extracts apartment listing information and saves it to Excel files.

## Requirements

- Python 3.8+
- Chrome browser installed
- Virtual environment (mandatory)

## Virtual Environment Setup (Mandatory)

### 1. Create Virtual Environment
```bash
# Windows
python -m venv .venv

# Linux/MacOS
python3 -m venv .venv
```

### 2. Activate Virtual Environment
```bash
# Windows (PowerShell)
.\.venv\Scripts\Activate.ps1

# Windows (Command Prompt)
.\.venv\Scripts\activate.bat

# Linux/MacOS
source .venv/bin/activate
```

### 3. Install Required Dependencies
```bash
pip install -r requirements.txt
```

### Virtual Environment Structure
The `.venv` directory structure:
```
.venv/
├── Include/
├── Lib/
│   └── site-packages/  # Where all installed packages are stored
├── Scripts/ (Windows) or bin/ (Linux/MacOS)
│   ├── activate        # Activation scripts
│   ├── activate.bat    # Windows CMD activation
│   ├── Activate.ps1    # PowerShell activation
│   ├── python.exe      # Python interpreter
│   └── pip.exe         # Package installer
└── pyvenv.cfg          # Virtual environment configuration
```

### Required Packages
The following packages will be installed from requirements.txt:
- selenium==4.15.2 (Web automation)
- pandas==2.1.3 (Data manipulation)
- openpyxl==3.1.2 (Excel file handling)
- webdriver-manager==4.0.1 (Browser driver management)
- requests==2.31.0 (HTTP requests)
- urllib3==2.1.0 (HTTP client)
- chromedriver-autoinstaller==0.6.3 (Chrome driver setup)

### Important Notes
1. **NEVER** commit the `.venv` directory to version control (it's already in `.gitignore`)
2. Always activate the virtual environment before running the project
3. If you install new packages, update `requirements.txt` with:
   ```bash
   pip freeze > requirements.txt
   ```
4. Make sure you have Python installed on your system (Python 3.8+ required)
5. The virtual environment isolates project dependencies from your global Python installation

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