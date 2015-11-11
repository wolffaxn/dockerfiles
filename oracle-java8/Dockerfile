FROM wolffaxn/base:latest

MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

# Java 8
RUN (wget --progress=bar:force --header "Cookie: oraclelicense=accept-securebackup-cookie" --no-check-certificate --no-cookies -O /tmp/jdk-8u65-linux-x64.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u65-b17/jdk-8u65-linux-x64.tar.gz && \
    echo "196880a42c45ec9ab2f00868d69619c0 /tmp/jdk-8u65-linux-x64.tar.gz" | md5sum -c > /dev/null 2>&1 || echo "error: md5 mismatch" && \
    mkdir -p /usr/java && \
    tar xzf /tmp/jdk-8u65-linux-x64.tar.gz -C /usr/java && \
    rm /tmp/jdk-8u65-linux-x64.tar.gz && \
    ln -s /usr/java/jdk1.8.0_65 /usr/java/java8 && \
    chown root:root -R /usr/java/jdk1.8.0_65)

# define JAVA_HOME variable
ENV JAVA_HOME /usr/java/java8

# default command
CMD ["/bin/bash"]
