FROM registry.access.redhat.com/openshift3/jenkins-slave-base-rhel7

USER root

COPY /policy.json /etc/containers/
COPY /skopeo /usr/bin/

RUN chown -R 1001:0 $HOME
RUN chmod -R g+rw $HOME
RUN chmod +x /usr/bin/skopeo
RUN chown -R 1001:0 /etc/containers
RUN chmod -R g+rw /etc/containers

USER 1001
