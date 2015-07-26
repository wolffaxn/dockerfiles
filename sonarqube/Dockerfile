FROM wolffaxn/oracle-java8:latest

MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

ENV SONARQUBE_VERSION 5.1.1

RUN yum -y install postgresql-client; yum clean all

# add user and group 'sonar' and set its pasword
RUN (useradd -s /bin/bash -c "sonar user" sonar && \
    echo "sonar:sonar" | chpasswd)

RUN (mkdir -p /home/sonar/bin && mkdir -p /home/sonar/logs)

ADD bin/setenv.sh /home/sonar/bin/setenv.sh
ADD bin/startup.sh /home/sonar/bin/startup.sh
RUN (chmod 750 /home/sonar/bin/*.sh && chown -R sonar:sonar /home/sonar)

RUN (wget --progress=bar:force --no-cookies -O /tmp/sonarqube-$SONARQUBE_VERSION.zip http://dist.sonar.codehaus.org/sonarqube-$SONARQUBE_VERSION.zip && \
    echo "033a848a38dac8dd58bd0bd9a35fdd47 /tmp/sonarqube-$SONARQUBE_VERSION.zip" | md5sum -c > /dev/null 2>&1 || echo "error: md5 mismatch" && \
    unzip /tmp/sonarqube-$SONARQUBE_VERSION.zip -d /usr/share && \
    rm /tmp/sonarqube-$SONARQUBE_VERSION.zip && \
    ln -s /usr/share/sonarqube-$SONARQUBE_VERSION /usr/share/sonarqube)

ADD conf/sonar.properties /usr/share/sonarqube-$SONARQUBE_VERSION/conf/sonar.properties
RUN chown -R sonar:sonar /usr/share/sonarqube-$SONARQUBE_VERSION

ENV DB_HOST postgresql
ENV DB_PORT 5432
ENV DB_USER sonar
ENV DB_PASS sonar

# supervisord
ADD conf/sonarqube.conf /etc/supervisord.d/sonarqube.conf

EXPOSE 22 8080

# default command
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
