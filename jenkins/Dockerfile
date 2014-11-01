FROM wolffaxn/tomcat7:latest

MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

ENV JENKINS_VERSION 1.565.3

# create directory structure, add user and group 'jenkins' and set its pasword
RUN (mkdir -p /usr/share/jenkins/bin && \
    mkdir -p /usr/share/jenkins/conf && \
    mkdir -p /usr/share/jenkins/logs && \
    mkdir -p /usr/share/jenkins/temp && \
    mkdir -p /usr/share/jenkins/webapps && \
    mkdir -p /usr/share/jenkins/work && \
    useradd -d /home/jenkins -m -s /bin/bash -c "jenkins user" jenkins && \
    echo "jenkins:jenkins" | chpasswd)

ADD bin/setenv.sh /usr/share/jenkins/bin/setenv.sh
ADD bin/startup.sh /usr/share/jenkins/bin/startup.sh
ADD bin/shutdown.sh /usr/share/jenkins/bin/shutdown.sh
RUN chmod 750 /usr/share/jenkins/bin/*.sh

RUN cp /usr/share/tomcat7/conf/* /usr/share/jenkins/conf
ADD conf/server.xml /usr/share/jenkins/conf/server.xml
RUN chmod 640 /usr/share/jenkins/conf/*

RUN (wget --progress=bar:force --no-check-certificate --no-cookies -O /tmp/jenkins.war http://mirrors.jenkins-ci.org/war-stable/$JENKINS_VERSION/jenkins.war && \
    mv /tmp/jenkins.war /usr/share/jenkins/webapps && \
    chmod 640 /usr/share/jenkins/webapps/*.war && \
    chown -R jenkins:jenkins /usr/share/jenkins && \
    mkdir /var/jenkins && \
    chown -R jenkins:jenkins /var/jenkins)

VOLUME /var/jenkins

# supervisord
ADD conf/jenkins.conf /etc/supervisord.d/jenkins.conf

EXPOSE 8080

# default command
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
