FROM centos:centos7

MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

RUN (yum -y update; yum clean all && \
    yum -y install epel-release; yum clean all && \
    yum -y install bash curl openssh-server tar vim wget zsh; yum clean all)

# set timezone
RUN ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
# regenerating ssh host keys
RUN (rm -rvf /etc/ssh/ssh_host_*_key && \
    ssh-keygen -q -t rsa -f /etc/ssh/ssh_host_rsa_key -N '')
