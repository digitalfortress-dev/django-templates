# -----------------
# Base build stage
FROM python:3.11-alpine AS builder

# Create the app directory
RUN mkdir /app

# Set the working directory
WORKDIR /app

# Set environment variables to optimize Python
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install dependencies first for caching benefit
RUN pip install --upgrade pip
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# -----------------
# Production stage
FROM python:3.11-alpine

# Set environment arguments
ARG ENV
ARG SECRET_KEY
ARG ALLOWED_HOSTS
ARG HOST
ARG DB_NAME
ARG DB_USERNAME
ARG DB_PASSWORD
ARG DB_HOST
ARG DB_PORT
ARG JWT_SIGNING_KEY
ARG CORS_ALLOWED_ORIGINS

# Set environment variables
ENV DJANGO_SETTINGS_MODULE "project_name.settings"
ENV ENV ${ENV}
ENV SECRET_KEY ${SECRET_KEY}
ENV ALLOWED_HOSTS ${ALLOWED_HOSTS}
ENV HOST ${HOST}
ENV DB_NAME ${DB_NAME}
ENV DB_USERNAME ${DB_USERNAME}
ENV DB_PASSWORD ${DB_PASSWORD}
ENV DB_HOST ${DB_HOST}
ENV DB_PORT ${DB_PORT}
ENV JWT_SIGNING_KEY ${JWT_SIGNING_KEY}
ENV CORS_ALLOWED_ORIGINS ${CORS_ALLOWED_ORIGINS}

# Copy the Python dependencies from the builder stage
COPY --from=builder /usr/local/lib/python3.11/site-packages/ /usr/local/lib/python3.11/site-packages/
COPY --from=builder /usr/local/bin/ /usr/local/bin/

# Set the working directory
WORKDIR /app

# Copy application code
COPY . .

# Set environment variables to optimize Python
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Expose the application port
EXPOSE 80

# Make entry file executable
RUN chmod +x  ./docker-entrypoint.sh

# Start the application using Gunicorn
CMD ["./docker-entrypoint.sh"]
