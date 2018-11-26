# Oingo

Your friendly neighbor

## Warning (must read)

By running this application, you accept the risk of losing everything you previously stored in a database called `oingo`.

## Requirements

The application can be deployed in 2 ways, though it's only tested on Ubuntu.

### Containerization

* Docker: [Official Installation Guide](https://docs.docker.com/install/)
* Docker Compose: `pip install docker-compose`

To run the application, do the following:
```
docker-compose up
```

### Native Solution

* MySQL/MariaDB server (must be running)
* Python
* PIP

To run the application, do the following. Administrative privilege may be required:
```
mysql -u <user> --password=<password> -h <host> < create.sql
pip install -r requirements.txt
gunicorn server:app -b :80 --log-file 'gunicorn.log' --log-level info
```
