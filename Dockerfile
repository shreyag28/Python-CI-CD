FROM python:3.7.3-stretch

ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY --from=aquasec/trivy:latest /usr/local/bin/trivy /usr/local/bin/trivy

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

RUN chmod +x /app/django.sh

EXPOSE 8000

ENTRYPOINT ["/app/django.sh"]
