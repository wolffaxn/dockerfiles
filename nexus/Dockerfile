FROM wolffaxn/tomcat:latest

MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

RUN yum -y install supervisor; yum clean all

# Nexus
RUN useradd -m -d /home/nexus -s /bin/bash -c "nexus user" nexus

RUN (mkdir -p /home/nexus/bin && \
    mkdir -p /home/nexus/conf && \
    mkdir -p /home/nexus/logs && \
    mkdir -p /home/nexus/temp && \
    mkdir -p /home/nexus/webapps && \
    mkdir -p /home/nexus/work)

ADD bin/setenv.sh /home/nexus/bin/setenv.sh
ADD bin/startup.sh /home/nexus/bin/startup.sh
ADD bin/shutdown.sh /home/nexus/bin/shutdown.sh
RUN chmod 750 /home/nexus/bin/*.sh

RUN cp /usr/share/tomcat7/conf/* /home/nexus/conf
ADD conf/server.xml /home/nexus/conf/server.xml
RUN chmod 640 /home/nexus/conf/*

RUN (wget --progress=bar:force --no-check-certificate --no-cookies -O /tmp/nexus.war http://download.sonatype.com/nexus/oss/nexus-2.9.2-01.war && \
    mv /tmp/nexus.war /home/nexus/webapps && \
    chmod 640 /home/nexus/webapps/*.war && \
    chown -R nexus:nexus /home/nexus && \
    mkdir /var/nexus && \
    chown -R nexus:nexus /var/nexus)

# supervisord
RUN mkdir -p /var/run/supervisord
ADD conf/supervisord.conf /etc/supervisord.conf

EXPOSE 22 8080
CMD supervisord -c /etc/supervisord.conf
