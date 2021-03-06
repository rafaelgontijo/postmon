FROM ubuntu:16.04
MAINTAINER Bluesoft Fire <devops@bluesoft.com.br>

RUN apt-get -y update && \
    apt-get -y --no-install-recommends install \
        gcc \
        ipython \
        libz-dev \
        libxml2-dev \
        libxslt1-dev \
        mongodb \
        python2.7 \
        python2.7-dev \
        python-pip \
	      python-setuptools

ENV APP_DIR /srv/postmon

RUN mkdir -p $APP_DIR
ADD . $APP_DIR
WORKDIR $APP_DIR

RUN /usr/bin/pip install -r requirements.txt
RUN mkdir -p data/db

EXPOSE 9876

ENTRYPOINT sh run.sh
