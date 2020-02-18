#Run virtual environemnt
Setup:
	python3 -m venv ~/.virtualenv
	source .virtualenv/bin/activate 

#Show information about environment
env:
	which python3
	python3 --version
	which pytest
	which pylint
	docker --version


# Install requirements.txt inside virtual environment
install:
	pip install --upgrade pip &&\
	pip install -r requirements.txt

# Additional, optional, tests could go here
test:
	python -m pytest -vv --cov=libs tests/*.py
	python -m pytest --nbval notebook.ipynb

validate-circleci:
	# See https://circleci.com/docs/2.0/local-cli/#processing-a-config
	circleci config process .circleci/config.yml

run-circleci-local:
	# See https://circleci.com/docs/2.0/local-cli/#running-a-job
	circleci local execute

# Test for sintaxis
lint:
	hadolint Dockerfile
	pylint --disable=R,C virtualenv cli web

all: install lint test
