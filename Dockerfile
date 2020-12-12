FROM ubuntu:16.04
ENV APPDIR /gh-docker
ENV LANG C.UTF-8
WORKDIR ${APPDIR}
RUN APT_INSTALL="apt-get install -y --no-install-recommends" && \
    rm -rf /var/lib/apt/lists/* && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 && \
    apt-add-repository https://cli.github.com/packages && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
    software-properties-common \
    pkg-config \
    build-essential \
    apt-utils \
    gh \
    git
RUN apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* ~/*
ADD entry.sh .
CMD ["bin/bash", "entry.sh"]
