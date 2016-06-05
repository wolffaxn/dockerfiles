FROM wolffaxn/base:latest
MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

ARG JENKINS_SHA
ENV JENKINS_SHA ${JENKINS_SHA:-79a3f25e9b466cb9e969d1772ea38550de320c88e9119bf8aa11ce8547c39987}

# Java
RUN curl -fSL --cookie "oraclelicense=accept-securebackup-cookie" -o /tmp/jdk-8u92-linux-x64.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u92-b14/jdk-8u92-linux-x64.tar.gz && \
    echo "$JENKINS_SHA /tmp/jdk-8u92-linux-x64.tar.gz" | sha256sum -c - && \
    mkdir -p /usr/java && \
    tar xzf /tmp/jdk-8u92-linux-x64.tar.gz -C /usr/java && \
    rm /tmp/jdk-8u92-linux-x64.tar.gz && \
    ln -s /usr/java/jdk1.8.0_92 /usr/java/jdk1.8.0 && \
    chown root:root -R /usr/java/jdk1.8.0_92 && \
    ln -s /usr/java/jdk1.8.0_92/bin/jjs /usr/bin

# define JAVA_HOME and PATH variable
ENV JAVA_HOME /usr/java/jdk1.8.0
ENV PATH $PATH:$JAVA_HOME/bin

# default command
CMD ["/bin/bash"]
