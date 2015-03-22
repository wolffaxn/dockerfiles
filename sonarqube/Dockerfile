FROM wolffaxn/oracle-java8:latest

MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

RUN yum -y install postgresql-client supervisor; yum clean all

# add user and group 'sonar' and set its pasword
RUN (useradd -s /bin/bash -c "sonar user" sonar && \
    echo "sonar:sonar" | chpasswd)

RUN (mkdir -p /home/sonar/bin && mkdir -p /home/sonar/logs)

ADD bin/setenv.sh /home/sonar/bin/setenv.sh
ADD bin/startup.sh /home/sonar/bin/startup.sh
RUN (chmod 750 /home/sonar/bin/*.sh && chown -R sonar:sonar /home/sonar)

RUN (wget --progress=bar:force --no-cookies -O /tmp/sonarqube-4.5.zip http://dist.sonar.codehaus.org/sonarqube-4.5.zip && \
    echo "a39a52a29344b422029bd8b04d1cb84d /tmp/sonarqube-4.5.zip" | md5sum -c > /dev/null 2>&1 || echo "error: md5 mismatch" && \
    unzip /tmp/sonarqube-4.5.zip -d /usr/share && \
    rm /tmp/sonarqube-4.5.zip && \
    ln -s /usr/share/sonarqube-4.5 /usr/share/sonarqube)

ADD conf/sonar.properties /usr/share/sonarqube-4.5/conf/sonar.properties
RUN chown -R sonar:sonar /usr/share/sonarqube-4.5

ENV DB_HOST postgresql
ENV DB_PORT 5432
ENV DB_USER sonar
ENV DB_PASS sonar

# supervisord
RUN mkdir -p /var/run/supervisord
ADD conf/supervisord.conf /etc/supervisord.conf

EXPOSE 22 8080
CMD supervisord -c /etc/supervisord.conf
