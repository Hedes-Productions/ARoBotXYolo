# Define variables
VENV_NAME := ARoBotXYolo
PYTHON :=  python

# Default target
all: install_virtualenv venv env_activate install run

install_virtualenv:
	pip install virtualenv
	@echo "virtualenv installed."

# Create virtual environment
venv:
	$(PYTHON) -m virtualenv $(VENV_NAME)
	@echo "Virtual environment $(VENV_NAME) created."

env_activate:
	. $(VENV_NAME)/bin/activate 
	@echo "Virtual environment $(VENV_NAME) activated."
# Install dependencies
install:
	pip install -r requirement.txt
	@echo "Dependencies installed."

# Clean virtual environment
clean:
	rm -rf $(VENV_NAME)
	@echo "Virtual environment $(VENV_NAME) removed."

# Run application
run:
	python camera_working.py
