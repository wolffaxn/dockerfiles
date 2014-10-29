FROM wolffaxn/tomcat:latest

MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

RUN yum -y install supervisor; yum clean all

# add user and group 'jenkins' and set its pasword
RUN (useradd -s /bin/bash -c "jenkins user" jenkins && \
    echo "jenkins:jenkins" | chpasswd)

RUN (mkdir -p /home/jenkins/bin && \
    mkdir -p /home/jenkins/conf && \
    mkdir -p /home/jenkins/logs && \
    mkdir -p /home/jenkins/temp && \
    mkdir -p /home/jenkins/webapps && \
    mkdir -p /home/jenkins/work)

ADD bin/setenv.sh /home/jenkins/bin/setenv.sh
ADD bin/startup.sh /home/jenkins/bin/startup.sh
ADD bin/shutdown.sh /home/jenkins/bin/shutdown.sh
RUN chmod 750 /home/jenkins/bin/*.sh

RUN cp /usr/share/tomcat7/conf/* /home/jenkins/conf
ADD conf/server.xml /home/jenkins/conf/server.xml
RUN chmod 640 /home/jenkins/conf/*

RUN (wget --progress=bar:force --no-check-certificate --no-cookies -O /tmp/jenkins.war http://mirrors.jenkins-ci.org/war-stable/1.565.3/jenkins.war && \
    mv /tmp/jenkins.war /home/jenkins/webapps && \
    chmod 640 /home/jenkins/webapps/*.war && \
    chown -R jenkins:jenkins /home/jenkins && \
    mkdir /var/jenkins && \
    chown -R jenkins:jenkins /var/jenkins)

# supervisord
RUN mkdir -p /var/run/supervisord
ADD conf/supervisord.conf /etc/supervisord.conf

EXPOSE 22 8080
CMD supervisord -c /etc/supervisord.conf
