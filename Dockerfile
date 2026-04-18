FROM python:3.10-slim

ENV PYTHONUNBUFFERED=1
WORKDIR /app

# Install minimal build dependencies for pip packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends gcc libffi-dev libssl-dev curl \
    && rm -rf /var/lib/apt/lists/*

COPY burn_project/requirements.txt ./burn_project/requirements.txt
WORKDIR /app/burn_project
RUN python -m pip install --upgrade pip setuptools wheel && \
    pip install -r requirements.txt

COPY burn_project/ ./
RUN python manage.py collectstatic --noinput

EXPOSE 8000
CMD ["gunicorn", "burn_project.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "1", "--timeout", "120"]
