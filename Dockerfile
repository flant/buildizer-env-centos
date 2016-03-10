FROM centos:centos7
MAINTAINER flant <256@flant.com>
ENTRYPOINT ["/bin/bash", "--login", "-c"]
CMD ["/bin/bash"]

RUN sed -i -r 's/# *(\".*history-search)/\1/' /etc/inputrc
RUN yum install -y which yum-utils vim
