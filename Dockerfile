FROM python:2.7-slim
MAINTAINER Graeme Renfrew <graemerenfrew@gmail.com>

ENV INSTALL_PATH /socialtrack
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .
RUN pip install .

CMD gunicorn -b 0.0.0.0:8000 --access-logfile - "socialtrack.app:create_app()"
