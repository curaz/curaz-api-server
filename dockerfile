FROM python:3.8.10
LABEL authors="changmin.kim"
EXPOSE 8080

WORKDIR /curazapiserver
COPY ./manage.py /curazapiserver/manage.py

COPY ./requirements.txt /curazapiserver/requirements.txt
RUN apt-get update && apt-get -y install libgl1-mesa-glx
RUN pip install --upgrade pip && \
    pip install --upgrade pip setuptools && \
    pip install --no-cache-dir --upgrade -r /curazapiserver/requirements.txt

COPY ./app /curazapiserver/app
# COPY ./resources /curazapiserver/resources
# COPY ./test /curazapiserver/test

ENTRYPOINT ["python", "manage.py", "runserver", "prod"]
