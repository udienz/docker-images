#Created at Mon Jun  6 16:59:26 UTC 2016
FROM udienz/buildpack:centos6
MAINTAINER Mahyuddin Susanto <udienz@gmail.com>

RUN yum update -y \
    && yum clean all

WORKDIR /tmp
RUN echo 'check_certificate = off' >> /etc/wgetrc \
    && wget -O /tmp/ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz \
    && tar xzf /tmp/ruby-install-0.6.0.tar.gz \
    && cd ruby-install-0.6.0 \
    && yum update -y \
    && make install \
    && ruby-install --system ruby 2.1.9 \
    && gem install --no-ri --no-rdoc bundler \
    && gem update --system \
    && rm -rf /tmp/ruby-install* \
    && ruby-install --cleanup \
    && yum clean all
WORKDIR /
