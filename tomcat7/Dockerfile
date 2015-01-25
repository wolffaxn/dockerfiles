FROM wolffaxn/oracle-java7:latest

MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

# Tomcat 7
RUN (wget --progress=bar:force --no-check-certificate --no-cookies -O /tmp/apache-tomcat-7.0.57.tar.gz http://www.eu.apache.org/dist/tomcat/tomcat-7/v7.0.57/bin/apache-tomcat-7.0.57.tar.gz && \
    echo "d6a07b41203f876440c9a7c8581db153 /tmp/apache-tomcat-7.0.57.tar.gz" | md5sum -c > /dev/null 2>&1 || echo "error: md5 mismatch" && \
    tar xzf /tmp/apache-tomcat-7.0.57.tar.gz -C /usr/share && \
    rm /tmp/apache-tomcat-7.0.57.tar.gz && \
    ln -s /usr/share/apache-tomcat-7.0.57 /usr/share/tomcat7 && \
    chown root:root -R /usr/share/apache-tomcat-7.0.57)

RUN (mkdir -p /var/log/tomcat && mkdir -p /var/run/tomcat)

# define CATALINA_HOME variable
ENV CATALINA_HOME /usr/share/tomcat7

# default command
CMD ["/bin/bash"]
