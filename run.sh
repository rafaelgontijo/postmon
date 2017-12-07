mongod --fork --logpath /tmp/mongo.log --dbpath data/db &
celery worker -B -A PostmonTaskScheduler -l info &
python PostmonServer.py
