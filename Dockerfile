FROM python:3.11-alpine
ENV PYTHONUNBUFFERED 1

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

# Allows docker to cache installed dependencies between builds
COPY ./requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Adds our application code to the image
COPY . code
WORKDIR /code

EXPOSE 80

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

RUN ["chmod", "+x", "./docker-entrypoint.sh"]

# Run the production server
ENTRYPOINT ["./docker-entrypoint.sh"]
