FROM wmoore28/epics:R3.14.12.5

ENV EPICS_BASE=/opt/epics/base \
    EPICS_HOST_ARCH=linux-x86_64 \
    PATH=$EPICS_BASE/bin/$EPICS_HOST_ARCH:$PATH \
    PATH=$EPICS_BASE/../extensions/bin/$EPICS_HOST_ARCH:$PATH

COPY configure /tmp/configure

RUN yum -y install \
        autoconf \
        automake \
        git \
        ImageMagick-c++-devel \
        libjpeg-turbo-devel \
        libtiff-devel \
        libtool \
        libxml2-devel \
        which \
    && yum clean all \
    #
    # build re2c, needed by synApps
    #
    && cd /usr/local/src \
    && git clone https://github.com/skvadrik/re2c \
    && cd re2c/re2c \
    && ./autogen.sh \
    && ./configure \
    && make install \
    #
    # areaDetector dependencies
    #
    && cd /usr/local/src \
    && git clone https://github.com/live-clones/hdf5 \
    && cd hdf5 \
    && ./autogen.sh \
    && ./configure --prefix=/usr/local/src/hdf5 \
    && make install \
    && cd /usr/local/src \
    && git clone https://github.com/erdc-cm/szip \
    && cd szip \
    && ./configure --prefix=/usr/local/src/szip \
    && make install \
    && cd /usr/local/src \
    && find . -name .git -exec rm -rf {} \+ \
    #
    # build extensions
    #
    && cd /opt/epics \
    && git clone https://github.com/wmoore28/epics-extensions extensions \
    && find . -name .git -exec rm -rf {} \+ \
    && cd extensions \
    && make \
    #
    # build synApps
    #
    && cd /opt/epics \
    && curl -LO https://www3.aps.anl.gov/bcda/synApps/tar/synApps_5_8.tar.gz \
    && tar -xf synApps_5_8.tar.gz \
    && mv synApps_5_8/support support \
    && rm -rf synApps* \
    && cd support \
    && mv -f /tmp/configure/support/RELEASE configure/ \
    && mv -f /tmp/configure/support/areaDetector-R2-0/* areaDetector-R2-0/configure/ \
    && make release \
    && make 
