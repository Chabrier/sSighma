FROM ubuntu:latest

RUN env \
    && apt-get update \
    && apt-get update \
    && apt-get -y install wget build-essential \
    && apt-get install -y locales \
    && locale-gen fr_FR.UTF-8 \
    && update-locale LANG=fr_FR.UTF-8 \
    && apt-get install -y python3-dev libpython3-dev python3-mysqldb python3-pip \
    && pip3 install cython \
    && apt-get -y install zip \
    && apt-get -y install unzip

RUN wget --no-check-certificate https://tentacule.be/fossil/py-sighma/zip/py-sighma.zip?uuid=trunk \
    && mv py-sighma.zip\?uuid\=trunk  py-sighma.zip \
    && unzip py-sighma.zip

RUN cd py-sighma/src \
    && python3 setup.py