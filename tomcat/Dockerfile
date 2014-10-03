FROM wolffaxn/java:latest

MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

# Tomcat 7
RUN (wget --progress=bar:force --no-check-certificate --no-cookies -O /tmp/apache-tomcat-7.0.55.tar.gz http://www.eu.apache.org/dist/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-7.0.55.tar.gz && \
    echo "3c46fc0f608c1280dcd65100a983f285 /tmp/apache-tomcat-7.0.55.tar.gz" | md5sum -c > /dev/null 2>&1 || echo "error: md5 mismatch" && \
    tar xzf /tmp/apache-tomcat-7.0.55.tar.gz -C /usr/share && \
    rm /tmp/apache-tomcat-7.0.55.tar.gz && \
    ln -s /usr/share/apache-tomcat-7.0.55 /usr/share/tomcat7 && \
    chown root:root -R /usr/share/apache-tomcat-7.0.55)

# Tomcat 8
RUN (wget --progress=bar:force --no-check-certificate --no-cookies -O /tmp/apache-tomcat-8.0.14.tar.gz http://www.eu.apache.org/dist/tomcat/tomcat-8/v8.0.14/bin/apache-tomcat-8.0.14.tar.gz && \
    echo "96063b1e477869e8ff4801d777e8915b /tmp/apache-tomcat-8.0.14.tar.gz" | md5sum -c > /dev/null 2>&1 || echo "error: md5 mismatch" && \
    tar xzf /tmp/apache-tomcat-8.0.14.tar.gz -C /usr/share && \
    rm /tmp/apache-tomcat-8.0.14.tar.gz && \
    ln -s /usr/share/apache-tomcat-8.0.14 /usr/share/tomcat8 && \
    chown root:root -R /usr/share/apache-tomcat-8.0.14)

RUN mkdir -p /var/run/tomcat
