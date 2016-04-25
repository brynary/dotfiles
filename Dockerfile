FROM ubuntu:trusty

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -q -y --no-install-recommends \
  build-essential \
  checkinstall \
  curl \
  git \
  libicu-dev \
  libsqlite3-dev \
  libssl-dev \
  man \
  openssh-client \
  python-dev \
  screen \
  software-properties-common \
  tmux \
  vim \
  wget

# Ack
RUN curl http://beyondgrep.com/ack-2.14-single-file > /usr/bin/ack && chmod 0755 /usr/bin/ack

# z
RUN curl "https://raw.githubusercontent.com/rupa/z/master/z.sh" > /usr/local/share/z.sh

# Node.js
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y nodejs

RUN apt-add-repository -y ppa:brightbox/ruby-ng && \
    apt-get update && \
    apt-get install -y ruby-switch ruby1.9.3 ruby2.2

# Docker Client
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9 && \
  echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list && \
  apt-get update && apt-get install -q -y --no-install-recommends lxc-docker

# Docker Compose
RUN curl -L https://github.com/docker/compose/releases/download/1.5.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

RUN add-apt-repository ppa:git-core/ppa && \
    apt-get update && \
    apt-get install -y git

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

RUN useradd --create-home --shell /bin/bash dev

ADD files /

RUN chown -R dev:dev /home/dev

CMD /bin/sh -c 'sleep infinity'
