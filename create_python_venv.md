# Setup Python Virtual Environement

**Requirements**  
Instructions for Windows. Linux Ubuntu is below as well. 
  
* Ensure python is installed to your path  
* Ensure you have python 3.9+ installed from the website and not the Microsoft Store  
* Ensure you have pre-selected where you want this directory setup  
  
## Windows Steps
    mkdir venv
    py -m venv .\venv

### Activate Environment
    .\venv\Scripts\activate
### Ensure Pip is up to date
    py -m pip install --upgrade pip

### Install necessary packages

#### Option 1: Install packages: i.e. Pandas
    py -m pip install pandas
    
#### Option2: Install packages from requirements.txt file
    pip install -r requirements.txt
    
## Linux Steps
Note: This was tested on Ubuntu 22 with python 3.10  

Navigate the project folder  

IF not installed 

    sudo apt install python3.10-venv
    
ELSE  

    mkdir venv
    sudo python3 -m venv ./venv

### Activate Environment
    ./venv/bin/activate
### Ensure Pip is up to date
    python3 -m pip install --upgrade pip

### Install necessary packages

#### Option 1: Install packages: i.e. Pandas
    python3 -m pip install pandas
    
#### Option2: Install packages from requirements.txt file
    pip3 install -r requirements.txt

# Deactivate environment

    deactivate
    
*It is best practice to always be in your virtual environment when working on a python project
