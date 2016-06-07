#Created at Mon Jun  6 16:51:37 UTC 2016
FROM udienz/buildpack:xenial
MAINTAINER Mahyuddin Susanto <udienz@gmail.com>

# Install and configure a basic SSH server
RUN apt-get update \
    && sudo apt-get dist-upgrade -y \
    && sudo apt-get install wget build-essential -y \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN wget -O ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz \
    && apt-get update \
    && tar xzf /tmp/ruby-install-0.6.0.tar.gz \
    && cd ruby-install-0.6.0 \
    && make install \
    && ruby-install --system ruby 2.2.5 \
    && gem install --no-ri --no-rdoc bundler \
    && gem update --system \
    && rm -rf /tmp/ruby-install* \
    && ruby --version \
    && ruby-install --cleanup \
    && apt-get clean -y \
    && cd /tmp/ \
    && rm -rf /var/lib/apt/lists/* /tmp/*
