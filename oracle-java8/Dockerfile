FROM wolffaxn/base:latest

MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

# Java 8
RUN (wget --progress=bar:force --header "Cookie: oraclelicense=accept-securebackup-cookie" --no-check-certificate --no-cookies -O /tmp/jdk-8u92-linux-x64.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u92-b14/jdk-8u92-linux-x64.tar.gz && \
    echo "65a1cc17ea362453a6e0eb4f13be76e4 /tmp/jdk-8u92-linux-x64.tar.gz" | md5sum -c > /dev/null 2>&1 || echo "error: md5 mismatch" && \
    mkdir -p /usr/java && \
    tar xzf /tmp/jdk-8u92-linux-x64.tar.gz -C /usr/java && \
    rm /tmp/jdk-8u92-linux-x64.tar.gz && \
    ln -s /usr/java/jdk1.8.0_92 /usr/java/jdk1.8.0 && \
    chown root:root -R /usr/java/jdk1.8.0_92 && \
    ln -s /usr/java/jdk1.8.0_92/bin/jjs /usr/bin)

# define JAVA_HOME and PATH variable
ENV JAVA_HOME /usr/java/jdk1.8.0
ENV PATH $PATH:$JAVA_HOME/bin

# default command
CMD ["/bin/bash"]
