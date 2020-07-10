FROM jenkins/inbound-agent
MAINTAINER Rwing <@rwing>

ENV DOCKER_VERSION=19.3.0-ce KUBECTL_VERSION=v1.18.5

USER root
RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends \
    make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz \
		&& tar --strip-components=1 -xvzf docker-${DOCKER_VERSION}.tgz -C /usr/local/bin \
		&& chmod -R +x /usr/local/bin/docker

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

# curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \ && chmod +x /usr/local/bin/docker-compose

# With newest docker

# FROM jenkinsci/jnlp-slave
# MAINTAINER Adria Galin <@adriagalin>
#
# ENV DOCKER_VERSION latest
#
# USER root
# RUN curl -sSL -o /tmp/docker-${DOCKER_VERSION}.tgz https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz \
#     && tar xzf /tmp/docker-${DOCKER_VERSION}.tgz -C /tmp \
#     && rm /tmp/docker-${DOCKER_VERSION}.tgz \
#     && chmod -R +x /tmp/docker/ \
#     && mv /tmp/docker/* /usr/bin/
