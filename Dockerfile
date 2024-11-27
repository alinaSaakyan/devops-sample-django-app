FROM python:3.8-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
   gcc \
   python3-dev \
   libpq-dev \
   && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install uwsgi

COPY . .

EXPOSE 8000

CMD ["sh", "-c", "python3 manage.py migrate && uwsgi --http 0.0.0.0:8000 --wsgi-file ./parrotsite/wsgi.py"]
