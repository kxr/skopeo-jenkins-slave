FROM registry.access.redhat.com/openshift3/jenkins-slave-base-rhel7

USER root

ENV SKOPEO_BIN=https://github.com/sabre1041/ocp-support-resources/blob/master/skopeo/bin/skopeo?raw=true

USER root

COPY /policy.json /etc/containers/

RUN chown -R 1001:0 $HOME
RUN chmod -R g+rw $HOME
#RUN curl -L -o /usr/bin/skopeo $SKOPEO_BIN
#RUN chmod +x /usr/bin/skopeo
RUN yum -y install skopeo
RUN chown -R 1001:0 /etc/containers
RUN chmod -R g+rw /etc/containers

USER 1001
