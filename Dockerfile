FROM python:3.10
ENV PYTHONUNBUFFERED 1

ARG ENV
ARG SECRET_KEY
ARG DB_NAME
ARG DB_USERNAME
ARG DB_PASSWORD
ARG DB_HOST
ARG CORS_ALLOWED_ORIGINS
ARG HOST

# Allows docker to cache installed dependencies between builds
COPY ./requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Adds our application code to the image
COPY . code
WORKDIR code

EXPOSE 80

ENV ENV ${ENV}
ENV SECRET_KEY ${SECRET_KEY}
ENV DB_NAME ${DB_NAME}
ENV DB_USERNAME ${DB_USERNAME}
ENV DB_PASSWORD ${DB_PASSWORD}
ENV DB_HOST ${DB_HOST}
ENV CORS_ALLOWED_ORIGINS ${CORS_ALLOWED_ORIGINS}
ENV HOST ${HOST}

# Run the production server
CMD gunicorn --bind 0.0.0.0:80 --access-logfile - project_name.wsgi
