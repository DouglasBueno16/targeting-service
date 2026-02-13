# Build image
FROM python:3.9-slim as builder

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

# Final image
FROM python:3.9-slim
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
WORKDIR /app
COPY . .

RUN useradd app
USER app

CMD ["python", "app.py"]
