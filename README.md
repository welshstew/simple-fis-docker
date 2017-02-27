# simple-fis-docker

Just a quick example on how to push a hawt-app artifact into a docker build, which could be run independant of openshift.

```
oc new-project fis1

export REGISTRY_IP=$(oc get svc/docker-registry -n default -o json | jq -r .spec.clusterIP)

docker build --build-arg HAWT_DEPLOYABLE_NAME=camel-ibmmq-helloworld-1.0 --build-arg HAWT_DEPLOYABLE_URL=http://10.1.2.4:8081/nexus/content/repositories/releases/com/nullendpoint/camel-ibmmq-helloworld/1.0/camel-ibmmq-helloworld-1.0.tar.gz .

docker build -t $REGISTRY_IP:5000/fis1/whatever-name:latest . 
docker login -u admin -p `oc whoami -t` $REGISTRY_IP:5000
docker push $REGISTRY_IP:5000/fis1/whatever-name:latest

```


http://10.1.2.4:8081/nexus/content/repositories/releases/com/nullendpoint/camel-ibmmq-helloworld/1.0/camel-ibmmq-helloworld-1.0.tar.gz


