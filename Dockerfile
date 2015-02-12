FROM dockerfile/java:oracle-java8
MAINTAINER savaki

ENV ZK_VERSION 3.4.6

RUN apt-get update && apt-get install -y wget

# install zookeeper
RUN wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-${ZK_VERSION}/zookeeper-${ZK_VERSION}.tar.gz | tar -xzf - -C /opt \
    && mv /opt/zookeeper-${ZK_VERSION} /opt/zookeeper \
    && cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg \
    && mkdir -p /tmp/zookeeper

EXPOSE 2181 2888 3888
WORKDIR /opt/zookeeper

# location where snapshots will be stored
VOLUME ["/tmp/zookeeper"]

CMD ["/opt/zookeeper/bin/zkServer.sh", "start-foreground"]

