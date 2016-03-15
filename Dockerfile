FROM centos:centos7
MAINTAINER flant <256@flant.com>
ENTRYPOINT ["/bin/bash", "--login", "-c"]
CMD ["/bin/bash"]

RUN bash -lec "echo 'export LANG=en_US.utf8' | tee -a /etc/environment"

RUN yum install -y which yum-utils vim
RUN yum groupinstall -y 'Development Tools'

RUN bash -lec "\
curl -sSL https://rvm.io/mpapis.asc | gpg --import -; \
curl -sSL https://get.rvm.io | bash -s stable"
RUN bash -lec "rvm install 2.2.1 --quiet-curl"

RUN bash -lec "gem install package_cloud"
