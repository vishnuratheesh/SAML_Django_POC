#!/bin/bash

echo "Running long running command."
pwd
ls
python /app/manage.py runserver 0.0.0.0:8000
tail -f /dev/null