FROM wolffaxn/oracle-java8:latest

MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

ENV WILDFLY_VERSION 8.2.0.Final

# Wildfly 8
RUN (wget --progress=bar:force --no-check-certificate --no-cookies -O /tmp/wildfly-$WILDFLY_VERSION.tar.gz http://download.jboss.org/wildfly/$WILDFYL_VERSION/$WILDFLY_VERSION.tar.gz && \
    tar xzf /tmp//tmp/wildfly-$WILDFLY_VERSION.tar.gz -C /usr/share && \
    rm  /tmp/tmp/wildfly-$WILDFLY_VERSION.tar.gz && \
    ln -s /tmp/wildfly-$WILDFLY_VERSION /usr/share/wildfly && \
    chown root:root -R /tmp/wildfly-$WILDFLY_VERSION)

RUN (mkdir -p /var/log/wildfly && mkdir -p /var/run/wildfly)

# default command
CMD ["/bin/bash"]
