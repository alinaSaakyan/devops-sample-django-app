<h1>Party Parrot App</h1>

<img src='media/images/party-parrot.gif' alt='parrot' height="200" width="200">
<br>
<br>
<h3></h3>

Sample Python application on Django with PostgreSQL database.

<h3>Requirements</h3>

____

- python 3.8
- PostgreSQL
- django 4.0.1
- Pillow 9.0.0
- psycopg2-binary 2.9.3
- django-prometheus 2.2.0

<h3>Deployment with Docker 🐳</h3>

____

- install Docker

- start up Docker container (in project's directory run):
```shell
      docker-compose up -d
```

<h3>Local Deployment</h3>

____


- install and start PostgreSQL
```shell
      brew install postgresql
```
```shell
      brew services start postgresql
```
```shell
      psql postgres
```
- create database
```shell
      CREATE DATABASE app;
```
- create user and set password
```shell
      CREATE USER worker WITH PASSWORD 'worker';
      RANT ALL PRIVILEGES ON DATABASE app TO worker;
```
- install Python 3.8
```shell
      pyenv install 3.8
```
- install libs 
```shell
      pip3 install -r requirements.txt
```

* set environment export for variables:
```yaml
      DJANGO_DB_HOST: localhost
      DJANGO_DB_NAME: app
      DJANGO_DB_USER: worker
      DJANGO_DB_PASS: worker
      DJANGO_DB_PORT: "5432"
      DJANGO_DEBUG: "False"
```
- edit the .zshrc file:
```shell
      nano ~/.zshrc
```
```shell
   export DJANGO_DB_HOST=localhost
   export DJANGO_DB_NAME=app
   export DJANGO_DB_USER=worker
   export DJANGO_DB_PASS=worker
   export DJANGO_DB_PORT="5432"
   export DJANGO_DEBUG="False"
```
- apply the changes
```shell
   source ~/.zshrc
```

* migrate database (in project's directory run):
```shell
python3 manage.py migrate
```

* start application (in project's directory run):
```shell
python3 manage.py runserver 0.0.0.0:8000
```
