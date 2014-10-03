FROM wolffaxn/base:latest

MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

# Java 7
RUN (wget --progress=bar:force --header "Cookie: oraclelicense=accept-securebackup-cookie" --no-check-certificate --no-cookies -O /tmp/jdk-7u67-linux-x64.tar.gz http://download.oracle.com/otn-pub/java/jdk/7u67-b01/jdk-7u67-linux-x64.tar.gz && \
    echo "81e3e2df33e13781e5fac5756ed90e67 /tmp/jdk-7u67-linux-x64.tar.gz" | md5sum -c > /dev/null 2>&1 || echo "error: md5 mismatch" && \
    mkdir -p /usr/java && \
    tar xzf /tmp/jdk-7u67-linux-x64.tar.gz -C /usr/java && \
    rm /tmp/jdk-7u67-linux-x64.tar.gz && \
    ln -s /usr/java/jdk1.7.0_67 /usr/java/java7 && \
    chown root:root -R /usr/java/jdk1.7.0_67)

# Java 8
RUN (wget --progress=bar:force --header "Cookie: oraclelicense=accept-securebackup-cookie" --no-check-certificate --no-cookies -O /tmp/jdk-8u20-linux-x64.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u20-b26/jdk-8u20-linux-x64.tar.gz && \
    echo "ec7f89dc3697b402e2c851d0488f6299 /tmp/jdk-8u20-linux-x64.tar.gz" | md5sum -c > /dev/null 2>&1 || echo "error: md5 mismatch" && \
    mkdir -p /usr/java && \
    tar xzf /tmp/jdk-8u20-linux-x64.tar.gz -C /usr/java && \
    rm /tmp/jdk-8u20-linux-x64.tar.gz && \
    ln -s /usr/java/jdk1.8.0_20 /usr/java/java8 && \
    chown root:root -R /usr/java/jdk1.8.0_20)
