FROM wolffaxn/oracle-java8:latest

MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

ENV TOMCAT_VERSION 8.0.32

# Tomcat 8
RUN (wget --progress=bar:force --no-check-certificate --no-cookies -O /tmp/apache-tomcat-$TOMCAT_VERSION.tar.gz http://www.eu.apache.org/dist/tomcat/tomcat-8/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz && \
    echo "98e821d2755ae3f8e6d66536fcdaa1b0 /tmp/apache-tomcat-$TOMCAT_VERSION.tar.gz" | md5sum -c > /dev/null 2>&1 || echo "error: md5 mismatch" && \
    tar xzf /tmp/apache-tomcat-$TOMCAT_VERSION.tar.gz -C /usr/share && \
    rm /tmp/apache-tomcat-$TOMCAT_VERSION.tar.gz && \
    ln -s /usr/share/apache-tomcat-$TOMCAT_VERSION /usr/share/tomcat8 && \
    chown root:root -R /usr/share/apache-tomcat-$TOMCAT_VERSION)

RUN (mkdir -p /var/log/tomcat && mkdir -p /var/run/tomcat)

# define CATALINA_HOME variable
ENV CATALINA_HOME /usr/share/tomcat8

# default command
CMD ["/bin/bash"]
