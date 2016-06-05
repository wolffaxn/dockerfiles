FROM wolffaxn/tomcat7:latest

MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

ENV NEXUS_VERSION 2.13.0-01

# create directory structure, add user and group 'nexus' and set its password
RUN (mkdir -p /usr/share/nexus/bin \
    /usr/share/nexus/conf \
    /usr/share/nexus/logs \
    /usr/share/nexus/temp \
    /usr/share/nexus/webapps \
    /usr/share/nexus/work && \
    useradd -s /bin/bash -c "nexus user" nexus && \
    echo "nexus:nexus" | chpasswd)

ADD bin/setenv.sh /usr/share/nexus/bin/setenv.sh
ADD bin/startup.sh /usr/share/nexus/bin/startup.sh
ADD bin/shutdown.sh /usr/share/nexus/bin/shutdown.sh
RUN chmod 750 /usr/share/nexus/bin/*.sh

RUN cp /usr/share/tomcat7/conf/* /usr/share/nexus/conf
ADD conf/server.xml /usr/share/nexus/conf/server.xml
RUN chmod 640 /usr/share/nexus/conf/*

RUN (wget --progress=bar:force --no-check-certificate --no-cookies -O /tmp/nexus.war http://download.sonatype.com/nexus/oss/nexus-$NEXUS_VERSION.war && \
    mv /tmp/nexus.war /usr/share/nexus/webapps && \
    chmod 640 /usr/share/nexus/webapps/*.war && \
    chown -R nexus:nexus /usr/share/nexus && \
    mkdir /var/nexus && \
    chown -R nexus:nexus /var/nexus)

VOLUME ["/var/nexus"]

# supervisord
ADD conf/nexus.conf /etc/supervisord.d/nexus.conf

EXPOSE 8005 8080

# default command
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
