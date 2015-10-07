FROM ubuntu:trusty

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -q -y --no-install-recommends \
  build-essential checkinstall git vim screen wget man curl tmux openssh-server \
  python-dev erlang libicu-dev software-properties-common libsqlite3-dev

# Ack
RUN curl http://beyondgrep.com/ack-2.14-single-file > /usr/bin/ack && chmod 0755 /usr/bin/ack

# z
RUN curl "https://raw.githubusercontent.com/rupa/z/master/z.sh" > /usr/local/share/z.sh

# Ruby
RUN cd /tmp && \
  wget --no-check-certificate -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz && \
  tar -xzvf chruby-0.3.9.tar.gz && \
  cd chruby-0.3.9/ && \
  make install
RUN cd /tmp && \
  wget --no-check-certificate -O ruby-install-0.5.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.5.0.tar.gz && \
  tar -xzvf ruby-install-0.5.0.tar.gz && \
  cd ruby-install-0.5.0/ && \
  make install

# PHP and Node.js
RUN add-apt-repository -y ppa:ondrej/php5
RUN gpg -q --keyserver hkp://keyserver.ubuntu.com:80 --recv-key 4F4EA0AAE5267A6C && \
  gpg -q -a --export 4F4EA0AAE5267A6C | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y php5-cli nodejs

RUN ruby-install ruby 1.9.3-p545
RUN ruby-install ruby 2.2.2
RUN ruby-install jruby 1.7.19

RUN /bin/bash -c 'source /usr/local/share/chruby/chruby.sh && \
  chruby 2.2.2 && \
  gem install --no-ri --no-rdoc bundler && \
  chruby 1.9.3 && \
  gem install --no-ri --no-rdoc bundler && \
  chruby jruby && \
  gem install --no-ri --no-rdoc bundler'

# Docker Client
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9 && \
  echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list && \
  apt-get update && apt-get install -q -y --no-install-recommends lxc-docker

# Docker Compose
RUN curl -L https://github.com/docker/compose/releases/download/1.4.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# Ansible
RUN apt-add-repository ppa:ansible/ansible && \
  apt-get update && \
  apt-get install --no-install-recommends -y ansible python-pip

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

RUN useradd --create-home --shell /bin/bash dev

ADD files /

CMD /bin/sh -c 'sleep infinity'
