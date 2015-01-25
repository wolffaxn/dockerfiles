FROM wolffaxn/oracle-java8:latest

MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

# Tomcat 8
RUN (wget --progress=bar:force --no-check-certificate --no-cookies -O /tmp/apache-tomcat-8.0.17.tar.gz http://www.eu.apache.org/dist/tomcat/tomcat-8/v8.0.17/bin/apache-tomcat-8.0.17.tar.gz && \
    echo "22c1b8952fe31dd2d87a03cc9d33483e /tmp/apache-tomcat-8.0.17.tar.gz" | md5sum -c > /dev/null 2>&1 || echo "error: md5 mismatch" && \
    tar xzf /tmp/apache-tomcat-8.0.17.tar.gz -C /usr/share && \
    rm /tmp/apache-tomcat-8.0.17.tar.gz && \
    ln -s /usr/share/apache-tomcat-8.0.17 /usr/share/tomcat8 && \
    chown root:root -R /usr/share/apache-tomcat-8.0.17)

RUN (mkdir -p /var/log/tomcat && mkdir -p /var/run/tomcat)

# define CATALINA_HOME variable
ENV CATALINA_HOME /usr/share/tomcat8

# default command
CMD ["/bin/bash"]
