#!/usr/bin/env bash

# Exit on error

set -o errexit

pip install -r requirements.txt
python manage.py collectstatic --no-input
python manage.py migrate


# สร้าง Superuser แบบอัตโนมัติ (จะข้ามถ้ามี user นี้อยู่แล้ว)
if [ "$DJANGO_SUPERUSER_USERNAME" ]; then
  python manage.py createsuperuser \
    --no-input \
    --username $DJANGO_SUPERUSER_USERNAME \
    --email $DJANGO_SUPERUSER_EMAIL
fi