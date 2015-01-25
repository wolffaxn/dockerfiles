FROM wolffaxn/base:latest

MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

# Java 8
RUN (wget --progress=bar:force --header "Cookie: oraclelicense=accept-securebackup-cookie" --no-check-certificate --no-cookies -O /tmp/jdk-8u31-linux-x64.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u31-b13/jdk-8u31-linux-x64.tar.gz && \
    echo "173e24bc2d5d5ca3469b8e34864a80da /tmp/jdk-8u31-linux-x64.tar.gz" | md5sum -c > /dev/null 2>&1 || echo "error: md5 mismatch" && \
    mkdir -p /usr/java && \
    tar xzf /tmp/jdk-8u31-linux-x64.tar.gz -C /usr/java && \
    rm /tmp/jdk-8u31-linux-x64.tar.gz && \
    ln -s /usr/java/jdk1.8.0_31 /usr/java/java8 && \
    chown root:root -R /usr/java/jdk1.8.0_31)

# define JAVA_HOME variable
ENV JAVA_HOME /usr/java/java8

# default command
CMD ["/bin/bash"]
