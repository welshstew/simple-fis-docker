FROM registry.access.redhat.com/jboss-fuse-6/fis-java-openshift:1.0

ARG HAWT_DEPLOYABLE_NAME=simple-jetty-app-1.0-SNAPSHOT-app
ARG HAWT_DEPLOYABLE_URL=http://10.1.1.2/nexus/something/simple-jetty-app-1.0-SNAPSHOT-app.tar.gz

USER root
WORKDIR /tmp
COPY bin/* /tmp/
# curl the binary in

RUN curl -SL $HAWT_DEPLOYABLE_URL
RUN chmod +x /tmp/setup.sh
# ungzip the file and set permissions
RUN /tmp/setup.sh

USER 1001
