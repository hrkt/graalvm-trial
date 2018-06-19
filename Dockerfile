FROM  centos:centos7
LABEL maintainer="Hiroki Ito <hiroki110@gmail.com>"

ENV   GRAAL_VERSION=1.0.0-rc2
ENV   GRAAL_CE_URL=https://github.com/oracle/graal/releases/download/vm-${GRAAL_VERSION}/graalvm-ce-${GRAAL_VERSION}-linux-amd64.tar.gz

RUN   yum update && \
      yum install -y wget

RUN   cd /tmp && \
      wget $GRAAL_CE_URL -O graalvm-ce-linux-amd64.tar.gz && \
      tar -xvzf graalvm-ce-linux-amd64.tar.gz && \
      mkdir -p /usr/lib/jvm/graalvm && \
      mv graalvm-ce-${GRAAL_VERSION} /usr/lib/jvm/graalvm && \
      rm graalvm-ce-linux-amd64.tar.gz && \
      rm -rf /tmp/*

RUN   yum clean all

ENV   JAVA_HOME=/usr/lib/jvm/graalvm/graalvm-ce-${GRAAL_VERSION}
ENV   PATH=$PATH:$JAVA_HOME/bin
ENV   GRAALVM_HOME=/usr/lib/jvm/graalvm/graalvm-${GRAAL_VERSION}
