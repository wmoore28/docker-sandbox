FROM arm32v7/debian:jessie

ENV EPICS_BASE=/usr/local/epics/base \
    PATH=$PATH:/usr/local/epics/base/bin/linux-arm

RUN apt-get update \
    && apt-get install -y \
	curl \
	gcc \
	g++ \
	make \
	perl 	

RUN cd /usr/local/share/ca-certificates \
    && curl -sLO https://pki.jlab.org/JLabCA.crt \
    && update-ca-certificates

RUN mkdir /usr/local/epics \
    && cd /usr/local/epics \
    && curl -sLO http://www.aps.anl.gov/epics/download/base/baseR3.14.12.6.tar.gz \
    && tar xzf baseR3.14.12.6.tar.gz \
    && rm baseR3.14.12.6.tar.gz \
    && ln -s base-3.14.12.6 base \
    && cd base \
    && make install
