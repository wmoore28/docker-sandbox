FROM wmoore28/centos7

ENV PATH=/opt/epics/base/bin/linux-x86_64:$PATH \
    EPICS_BASE=/opt/epics/base \
    EPICS_HOST_ARCH=linux-x86_64

RUN yum -y install gcc-c++ make perl-devel readline-devel perl-Pod-Checker \
    && mkdir /opt/epics \
    && cd /opt/epics \
    && curl -sLO http://www.aps.anl.gov/epics/download/base/baseR3.14.12.5.tar.gz \
    && echo 'ef05593edb70c87d6ae02c3e1e7c4f3f325934f1b98deaba49203d9343861d72 baseR3.14.12.5.tar.gz' | sha256sum -c - \
    && tar -xf baseR3.14.12.5.tar.gz \
    && rm -f baseR3.14.12.5.tar.gz \
    && ln -s base-3.14.12.5 base \
    && cd base \
    && make install \
    && yum clean all
