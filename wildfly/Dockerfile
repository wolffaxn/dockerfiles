FROM wolffaxn/oracle-java8:latest

MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

ENV WILDFLY_VERSION 10.0.0.Final

# Wildfly
RUN (wget --progress=bar:force --no-check-certificate --no-cookies -O /tmp/wildfly-$WILDFLY_VERSION.tar.gz http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz && \
    tar xzf /tmp/wildfly-$WILDFLY_VERSION.tar.gz -C /usr/share && \
    rm  /tmp/wildfly-$WILDFLY_VERSION.tar.gz && \
    ln -s /usr/share/wildfly-$WILDFLY_VERSION /usr/share/wildfly && \
    chown root:root -R /usr/share/wildfly-$WILDFLY_VERSION)

RUN mkdir -p /var/log/wildfly /var/run/wildfly

# default command
CMD ["/bin/bash"]
