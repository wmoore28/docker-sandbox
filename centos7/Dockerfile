FROM centos:centos7

ENV http_proxy=http://jprox.jlab.org:8081 \
    https_proxy=https://jprox.jlab.org:8081

RUN cd /etc/pki/ca-trust/source/anchors \
    && curl -sLO http://pki.jlab.org/JLabCA.crt \
    && update-ca-trust \
    && yum -y update
