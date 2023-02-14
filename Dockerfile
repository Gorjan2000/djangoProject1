#FROM python:3.8
#ENV PYTHONUNBUFFERED 1
#RUN mkdir /code
#WORKDIR /code
#COPY requirements.txt /code/
#RUN pip install -r requirements.txt
#COPY . /code/

# Use an existing Python image as the base image
FROM python:3.9-alpine

# Set the working directory
WORKDIR /app

# Copy the requirement file
COPY requirements.txt .

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Django App
EXPOSE 8000

# Prometheus
EXPOSE 9090

# Run the Django application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
