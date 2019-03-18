BootStrap: docker
From: ubuntu:latest

%environment
  LC_ALL=fr_FR.UTF-8
  export LC_ALL
%setup
  wget --no-check-certificate https://tentacule.be/fossil/py-sighma/zip/py-sighma.zip?uuid=trunk
  mv py-sighma.zip\?uuid\=trunk  ${SINGULARITY_ROOTFS}/py-sighma.zip

%post
  apt-get -y install zip
  apt-get -y install unzip
  unzip py-sighma.zip
  apt-get update && apt-get -y install wget build-essential
  apt-get install -y locales
  locale-gen fr_FR.UTF-8
  update-locale LANG=fr_FR.UTF-8
  apt-get install -y python3-dev libpython3-dev python3-mysqldb python3-pip
  pip3 install cython
  cd py-sighma/src
  python3 setup.py

%runscript
  export LC_ALL=fr_FR.UTF-8
  cat "$*"
  echo /usr/bin/python3 /py-sighma/src/main.py file "$*"
  /usr/bin/python3 /py-sighma/src/main.py file "$*"
