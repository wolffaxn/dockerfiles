FROM wolffaxn/base:latest

MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

# Java 8
RUN (wget --progress=bar:force --header "Cookie: oraclelicense=accept-securebackup-cookie" --no-check-certificate --no-cookies -O /tmp/jdk-8u74-linux-x64.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u74-b02/jdk-8u74-linux-x64.tar.gz && \
    echo "4928d67633c5e5b397315b5cf5f8fa2e /tmp/jdk-8u74-linux-x64.tar.gz" | md5sum -c > /dev/null 2>&1 || echo "error: md5 mismatch" && \
    mkdir -p /usr/java && \
    tar xzf /tmp/jdk-8u74-linux-x64.tar.gz -C /usr/java && \
    rm /tmp/jdk-8u74-linux-x64.tar.gz && \
    ln -s /usr/java/jdk1.8.0_74 /usr/java/jdk1.8.0 && \
    chown root:root -R /usr/java/jdk1.8.0_74 && \
    ln -s /usr/java/jdk1.8.0_74/bin/jjs /usr/bin)

# define JAVA_HOME and PATH variable
ENV JAVA_HOME /usr/java/jdk1.8.0
ENV PATH $PATH:$JAVA_HOME/bin

# default command
CMD ["/bin/bash"]
