Setup Python
Requirements
Ensure python is installed to your path

Ensure you have python 3.9 installed

Ensure you have pre-selected where you want this directory setup

Setup Virtual Env

mkdir env
py -m venv .\env

# Activate Environment
.\env\Scripts\activate
# Ensure Pip is up to date
python -m pip install --upgrade pip

# Install Prefect
py -m pip install prefect
# Installs dbt
py -m pip install dbt-snowflake

# Alternative
# Deactivate environment
deactivate
*It is best practice to always be in your virtual environment when working on a python project
