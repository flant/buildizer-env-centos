FROM centos:centos6
MAINTAINER flant <256@flant.com>
ENTRYPOINT ["/bin/bash", "--login", "-c"]
CMD ["/bin/bash"]

RUN bash -lec "echo -e '[base-source]\nname=CentOS-\$releasever - Base Sources\nenabled=1\nbaseurl=http://vault.centos.org/centos/\$releasever/os/Source/\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-\$releasever' >> /etc/yum.repos.d/CentOS-Extra-Thepackager.repo"
RUN bash -lec "echo -e '[updates-source]\nname=CentOS-\$releasever - Updates Sources\nenabled=1\nbaseurl=http://vault.centos.org/centos/\$releasever/os/Source/\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-\$releasever' >> /etc/yum.repos.d/CentOS-Extra-Thepackager.repo"
RUN bash -lec "echo -e '[extras-source]\nname=CentOS-\$releasever - Extras Sources\nenabled=1\nbaseurl=http://vault.centos.org/centos/\$releasever/os/Source/\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-\$releasever' >> /etc/yum.repos.d/CentOS-Extra-Thepackager.repo"
RUN bash -lec "echo -e '[centosplus-source]\nname=CentOS-\$releasever - Centosplus Sources\nenabled=1\nbaseurl=http://vault.centos.org/centos/\$releasever/os/Source/\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-\$releasever' >> /etc/yum.repos.d/CentOS-Extra-Thepackager.repo"

RUN yum install -y which yum-utils vim
RUN yum groupinstall -y 'Development Tools'
