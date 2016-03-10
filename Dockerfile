FROM centos:centos7
MAINTAINER flant <256@flant.com>
ENTRYPOINT ["/bin/bash", "--login", "-c"]
CMD ["/bin/bash"]

RUN yum install -y which yum-utils vim
RUN yum groupinstall -y 'Development Tools'
