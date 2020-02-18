# Load Docker from python:3.7.3-stretch
FROM python:3.7.3-stretch

# Working Directory
WORKDIR /app

# Copy source code to working directory
COPY . app.py /app/

# Install packages from requiriments.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

# Expose port 80
# EXPOSE 80

# Run web.py at container lucnch
# CMD ["python","app.py"]