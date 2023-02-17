#FROM python:3.8
#ENV PYTHONUNBUFFERED 1
#RUN mkdir /code
#WORKDIR /code
#COPY requirements.txt /code/
#RUN pip install -r requirements.txt
#COPY . /code/


FROM python:3.9-alpine

# Se setira raboten folder
WORKDIR /app

# Se kopiraat potrebnite moduli
COPY requirements.txt .

# Se instaliraat potrebnite moduli
RUN pip install --no-cache-dir -r requirements.txt

# Se kopira kodot od aplikacijata
COPY . .

# Django aplikacijata da startne na port 8000
EXPOSE 8000

# Prometheus da startne na 9090
EXPOSE 9090

# Start na Django Aplikacijata
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

