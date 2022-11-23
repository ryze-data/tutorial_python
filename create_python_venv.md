# Setup Python Virtual Environement
## Requirements
Instructions for Windows. Linux and mac would need to be slightly adjusted

Ensure python is installed to your path
Ensure you have python 3.9 installed from the website and not the Microsoft Store
Ensure you have pre-selected where you want this directory setup

## Windows Steps
    mkdir venv
    py -m venv .\venv

### Activate Environment
    .\venv\Scripts\activate
### Ensure Pip is up to date
    py -m pip install --upgrade pip

### Install Prefect
    py -m pip install prefect
### Installs dbt
    py -m pip install dbt-snowflake

# Alternative
# Deactivate environment
    deactivate
*It is best practice to always be in your virtual environment when working on a python project
