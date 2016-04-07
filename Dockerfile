FROM centos:centos6
MAINTAINER flant <256@flant.com>
ENTRYPOINT ["/bin/bash", "--login", "-c"]
CMD ["/bin/bash"]

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN bash -lec "echo -e '[base-source]\nname=CentOS-\$releasever - Base Sources\nenabled=1\nbaseurl=http://vault.centos.org/centos/\$releasever/os/Source/\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-\$releasever' >> /etc/yum.repos.d/CentOS-Extra-Thepackager.repo"
RUN bash -lec "echo -e '[updates-source]\nname=CentOS-\$releasever - Updates Sources\nenabled=1\nbaseurl=http://vault.centos.org/centos/\$releasever/os/Source/\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-\$releasever' >> /etc/yum.repos.d/CentOS-Extra-Thepackager.repo"
RUN bash -lec "echo -e '[extras-source]\nname=CentOS-\$releasever - Extras Sources\nenabled=1\nbaseurl=http://vault.centos.org/centos/\$releasever/os/Source/\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-\$releasever' >> /etc/yum.repos.d/CentOS-Extra-Thepackager.repo"
RUN bash -lec "echo -e '[centosplus-source]\nname=CentOS-\$releasever - Centosplus Sources\nenabled=1\nbaseurl=http://vault.centos.org/centos/\$releasever/os/Source/\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-\$releasever' >> /etc/yum.repos.d/CentOS-Extra-Thepackager.repo"

RUN yum install -y which yum-utils vim tree rpmdevtools
RUN yum groupinstall -y 'Development Tools'

RUN bash -lec "\
curl -sSL https://rvm.io/mpapis.asc | gpg --import -; \
curl -sSL https://get.rvm.io | bash -s stable"
RUN bash -lec "rvm install 2.2.1 --quiet-curl"

RUN bash -lec "gem install fpm rpmchange"
