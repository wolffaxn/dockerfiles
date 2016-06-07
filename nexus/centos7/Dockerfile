FROM wolffaxn/java:latest
MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

ARG NEXUS_VERSION
ENV NEXUS_VERSION ${NEXUS_VERSION:-2.13.0-01}
ARG NEXUS_WORK
ENV NEXUS_WORK ${NEXUS_WORK:-/var/nexus}
ARG NEXUS_HTTP_PORT
ENV NEXUS_HTTP_PORT ${NEXUS_HTTP_PORT:-8080}
ARG NEXUS_AJP_PORT
ENV NEXUS_AJP_PORT ${NEXUS_AJP_PORT:-8009}

ARG user=nexus
ARG group=nexus
ARG uid=1002
ARG gid=1002

# add nexus user and group and set its password
RUN groupadd -g ${gid} ${group} && \
    useradd -d /home/nexus -u ${uid} -g ${gid} -m -s /bin/bash ${user} && \
    echo "nexus:nexus" | chpasswd

# create directory structure
RUN mkdir -p "$NEXUS_WORK" && \
    chown -R ${user}:${group} "$NEXUS_WORK"

VOLUME ["$NEXUS_WORK"]

RUN curl -fSL -o /tmp/nexus-$NEXUS_VERSION-bundle.tar.gz http://download.sonatype.com/nexus/oss/nexus-$NEXUS_VERSION-bundle.tar.gz && \
    tar xzf /tmp/nexus-$NEXUS_VERSION-bundle.tar.gz -C /usr/share && \
    rm /tmp/nexus-$NEXUS_VERSION-bundle.tar.gz && \
    rm -Rf /usr/share/sonatype-work && \
    ln -s /usr/share/nexus-$NEXUS_VERSION /usr/share/nexus && \
    chown ${user}:${group} -R /usr/share/nexus-$NEXUS_VERSION /usr/share/nexus

# http and ajp port
EXPOSE $NEXUS_HTTP_PORT $NEXUS_AJP_PORT

# supervisord
ADD supervisor-nexus.conf /etc/supervisord.d/supervisor-nexus.conf

# default command
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
