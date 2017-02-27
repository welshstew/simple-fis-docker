FROM registry.access.redhat.com/jboss-fuse-6/fis-java-openshift:1.0

# The argument assignments here are overidden by the --build-arg param
# docker build --build-arg HAWT_DEPLOYABLE_NAME=camel-ibmmq-helloworld-1.0 --build-arg HAWT_DEPLOYABLE_URL=http://10.1.2.4:8081/nexus/content/repositories/releases/com/nullendpoint/camel-ibmmq-helloworld/1.0/camel-ibmmq-helloworld-1.0.tar.gz .
ARG HAWT_DEPLOYABLE_NAME=camel-ibmmq-helloworld-1.0
ARG HAWT_DEPLOYABLE_URL=http://10.1.2.4:8081/nexus/content/repositories/releases/com/nullendpoint/camel-ibmmq-helloworld/1.0/camel-ibmmq-helloworld-1.0.tar.gz

USER root
WORKDIR /tmp
COPY bin/* /tmp/
# curl the binary in

RUN curl -OSL $HAWT_DEPLOYABLE_URL
RUN chmod +x /tmp/setup.sh
# ungzip the file and set permissions
RUN /tmp/setup.sh

USER 1001
