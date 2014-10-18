FROM wolffaxn/base:latest

MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

# Java 7
RUN (wget --progress=bar:force --header "Cookie: oraclelicense=accept-securebackup-cookie" --no-check-certificate --no-cookies -O /tmp/jdk-7u71-linux-x64.tar.gz http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-linux-x64.tar.gz && \
    echo "22761b214b1505f1a9671b124b0f44f4 /tmp/jdk-7u71-linux-x64.tar.gz" | md5sum -c > /dev/null 2>&1 || echo "error: md5 mismatch" && \
    mkdir -p /usr/java && \
    tar xzf /tmp/jdk-7u71-linux-x64.tar.gz -C /usr/java && \
    rm /tmp/jdk-7u71-linux-x64.tar.gz && \
    ln -s /usr/java/jdk1.7.0_71 /usr/java/java7 && \
    chown root:root -R /usr/java/jdk1.7.0_71)

# Java 8
RUN (wget --progress=bar:force --header "Cookie: oraclelicense=accept-securebackup-cookie" --no-check-certificate --no-cookies -O /tmp/jdk-8u25-linux-x64.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-linux-x64.tar.gz && \
    echo "e145c03a7edc845215092786bcfba77e /tmp/jdk-8u25-linux-x64.tar.gz" | md5sum -c > /dev/null 2>&1 || echo "error: md5 mismatch" && \
    mkdir -p /usr/java && \
    tar xzf /tmp/jdk-8u25-linux-x64.tar.gz -C /usr/java && \
    rm /tmp/jdk-8u25-linux-x64.tar.gz && \
    ln -s /usr/java/jdk1.8.0_25 /usr/java/java8 && \
    chown root:root -R /usr/java/jdk1.8.0_25)
