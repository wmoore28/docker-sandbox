FROM wmoore28/centos7

ENV PATH=/opt/epics/base/bin/linux-x86_64:$PATH \
    EPICS_BASE=/opt/epics/base \
    EPICS_HOST_ARCH=linux-x86_64

RUN yum -y install \
        git \
        gcc-c++ \
        make \
        perl-devel \
        readline-devel \
        perl-Pod-Checker \
        autoconf \
        automake \
    && mkdir /opt/epics \
    && cd /opt/epics \
    && curl -sLO http://www.aps.anl.gov/epics/download/base/baseR3.14.12.6.tar.gz \
    && echo 'bdd20ad185e8208e6032fc63af656f34d95375843f8d93c8ee684f22b5f79f0c baseR3.14.12.6.tar.gz' | sha256sum -c - \
    && tar -xf baseR3.14.12.6.tar.gz \
    && rm baseR3.14.12.6.tar.gz \
    && ln -s base-3.14.12.6 base \
    && cd base \
    && make install \
    && yum clean all
