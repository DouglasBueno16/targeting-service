# Specify the python base image
FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

# Install system dependencies for PostgreSQL
RUN apt-get update && apt-get install -y \
        libpq-dev \
        gcc \
        python3-dev \
        && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN if [ -f requirements.txt ]; then \
        pip install --no-cache-dir -r requirements.txt; \
        fi

COPY app.py .
COPY db/ .

EXPOSE 8003

CMD ["python", "app.py"]
