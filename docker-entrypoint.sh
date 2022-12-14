#!/bin/bash
set -e

if [ ! -f /home/matterllo/data/db.sqlite3 ]; then
  env
  echo 'Setting up database...'
  python manage.py migrate
  python manage.py loaddata /home/matterllo/core/fixtures/admin.json
  echo 'done.'
fi

if [ "$1" = 'sh' ]; then
    exec sh
else
    exec python manage.py runserver 0.0.0.0:8000
    exit
fi
