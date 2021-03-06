FROM centos:7
MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

# install main packages
RUN yum -y update; yum clean all && \
    yum -y install epel-release && \
    yum -y install bash curl net-tools openssh-server supervisor tar unzip vim zsh; yum clean all && \
    yum clean all && rm -rf /var/cache/yum/*

# set timezone
RUN ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# regenerating ssh host keys
RUN rm -rvf /etc/ssh/ssh_host_*_key && \
    ssh-keygen -q -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' && \
    ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' && \
    ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ed25519_key

# change root password and create admin user
RUN echo "root:root" | chpasswd && \
    useradd -s /bin/bash -c "admin user" admin && \
    echo "admin:admin" | chpasswd

# supervisord
RUN mkdir -p /var/run/sshd /var/run/supervisor
ADD supervisord.conf /etc/supervisord.conf

EXPOSE 22

# default command
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
