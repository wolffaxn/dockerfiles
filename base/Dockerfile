FROM centos:7

MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

RUN (yum -y update; yum clean all && \
    yum -y install epel-release; yum clean all && \
    yum -y install bash curl net-tools openssh-server supervisor tar unzip vim wget zsh; yum clean all)

# set timezone
RUN ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# regenerating ssh host keys
RUN (rm -rvf /etc/ssh/ssh_host_*_key && \
    ssh-keygen -q -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' && \
    ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '')

# change root password
RUN echo 'root:topsecret' | chpasswd

# supervisord
RUN mkdir -p /var/run/sshd /var/run/supervisor
ADD conf/supervisord.conf /etc/supervisord.conf

EXPOSE 22

# default command
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
