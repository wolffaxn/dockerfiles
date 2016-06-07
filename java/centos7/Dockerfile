FROM wolffaxn/base:latest
MAINTAINER Alexander Wolff <wolffaxn@gmail.com>

ARG JAVA_MAJOR
ENV JAVA_MAJOR ${JAVA_MAJOR:-8}
ARG JAVA_MINOR
ENV JAVA_MINOR ${JAVA_MINOR:-92}
ARG JAVA_BUILD
ENV JAVA_BUILD ${JAVA_BUILD:-14}
ARG JAVA_SHA256256
ENV JAVA_SHA256 ${JAVA_SHA256:-79a3f25e9b466cb9e969d1772ea38550de320c88e9119bf8aa11ce8547c39987}

# Java
RUN mkdir -p /usr/java && \
    curl -fSL --cookie "oraclelicense=accept-securebackup-cookie" \
    -o /tmp/jdk-${JAVA_MAJOR}u${JAVA_MINOR}-linux-x64.tar.gz \
    http://download.oracle.com/otn-pub/java/jdk/${JAVA_MAJOR}u${JAVA_MINOR}-b${JAVA_BUILD}/jdk-${JAVA_MAJOR}u${JAVA_MINOR}-linux-x64.tar.gz && \
    echo "${JAVA_SHA256} /tmp/jdk-${JAVA_MAJOR}u${JAVA_MINOR}-linux-x64.tar.gz" \
    | sha256sum -c - && \
    tar xzf /tmp/jdk-${JAVA_MAJOR}u${JAVA_MINOR}-linux-x64.tar.gz -C /usr/java && \
    rm /tmp/jdk-${JAVA_MAJOR}u${JAVA_MINOR}-linux-x64.tar.gz && \
    ln -s /usr/java/jdk1.${JAVA_MAJOR}.0_${JAVA_MINOR} /usr/java/java8 && \
    chown root:root -R /usr/java/jdk1.${JAVA_MAJOR}.0_${JAVA_MINOR} /usr/java/java${JAVA_MAJOR} && \
    ln -s /usr/java/jdk1.${JAVA_MAJOR}.0_${JAVA_MINOR}/bin/jjs /usr/bin

# define JAVA_HOME and PATH variable
ENV JAVA_HOME /usr/java/java${JAVA_MAJOR}
ENV PATH ${PATH}:${JAVA_HOME}/bin

# default command
CMD ["/bin/bash"]
