FROM wolffaxn/base:latest

MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

# Java 7
RUN (wget --progress=bar:force --header "Cookie: oraclelicense=accept-securebackup-cookie" --no-check-certificate --no-cookies -O /tmp/jdk-7u75-linux-x64.tar.gz http://download.oracle.com/otn-pub/java/jdk/7u75-b13/jdk-7u75-linux-x64.tar.gz && \
    echo "6f1f81030a34f7a9c987f8b68a24d139 /tmp/jdk-7u75-linux-x64.tar.gz" | md5sum -c > /dev/null 2>&1 || echo "error: md5 mismatch" && \
    mkdir -p /usr/java && \
    tar xzf /tmp/jdk-7u75-linux-x64.tar.gz -C /usr/java && \
    rm /tmp/jdk-7u75-linux-x64.tar.gz && \
    ln -s /usr/java/jdk1.7.0_75 /usr/java/java7 && \
    chown root:root -R /usr/java/jdk1.7.0_75)

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/java/java7

# Define default command.
CMD ["/bin/bash"]
