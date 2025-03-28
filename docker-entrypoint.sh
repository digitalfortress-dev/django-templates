#!/bin/ash

echo "Apply database migrations"
python manage.py migrate --noinput

echo "Starting server"
python -m gunicorn --bind 0.0.0.0:80 --workers 3 --access-logfile - project_name.wsgi
