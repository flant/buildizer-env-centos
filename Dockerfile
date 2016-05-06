FROM centos:centos7
MAINTAINER flant <256@flant.com>

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN yum install -y which yum-utils vim tree rpmdevtools
RUN yum groupinstall -y 'Development Tools'

RUN bash -lec "\
curl -sSL https://rvm.io/mpapis.asc | gpg --import -; \
curl -sSL https://get.rvm.io | bash -s stable"
RUN bash -lec "rvm install 2.2.1 --quiet-curl"

RUN bash -lec "gem install fpm rpmchange"
