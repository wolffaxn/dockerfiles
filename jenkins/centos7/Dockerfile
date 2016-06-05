FROM wolffaxn/java:latest
MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

ARG JENKINS_VERSION
ENV JENKINS_VERSION ${JENKINS_VERSION:-1.651.2}
ARG JENKINS_HOME
ENV JENKINS_HOME ${JENKINS_HOME:-/var/jenkins}
ARG JENKINS_HTTP_PORT
ENV JENKINS_HTTP_PORT ${JENKINS_HTTP_PORT:-8080}
ARG JENKINS_AJP_PORT
ENV JENKINS_AJP_PORT ${JENKINS_AJP_PORT:-8009}
ARG JENKINS_SLAVE
ENV JENKINS_SLAVE ${JENKINS_SLAVE:-50000}

ARG user=jenkins
ARG group=jenkins
ARG uid=2000
ARG gid=2000

# add jenkins user and group and set its password
RUN groupadd -g ${gid} ${group} && \
    useradd -d /home/jenkins -u ${uid} -g ${gid} -m -s /bin/bash ${user} && \
    echo "jenkins:jenkins" | chpasswd

# create directory structure
RUN mkdir -p /usr/share/jenkins/logs \
    /usr/share/jenkins/temp \
    /usr/share/jenkins/webapps \
    /usr/share/jenkins/work \
    /var/jenkins && \
    chown -R ${user}:${group} /usr/share/jenkins "$JENKINS_HOME"

VOLUME ["$JENKINS_HOME"]

RUN curl -fSL -o /usr/share/jenkins/webapps/jenkins.war http://repo.jenkins-ci.org/public/org/jenkins-ci/main/jenkins-war/${JENKINS_VERSION}/jenkins-war-${JENKINS_VERSION}.war && \
    chown ${user}:${group} /usr/share/jenkins/webapps/jenkins.war

# http, ajp and port used by attached slave agents
EXPOSE $JENKINS_HTTP_PORT $JENKINS_AJP_PORT $JENKINS_SLAVE

# supervisord
ADD supervisor-jenkins.conf /etc/supervisord.d/supervisor-jenkins.conf

# default command
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
