FROM ubuntu:16.04
ENV APPDIR /gh-docker
ENV LANG C.UTF-8
WORKDIR ${APPDIR}
RUN APT_INSTALL="apt-get install -y --no-install-recommends" && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
    software-properties-common \
    pkg-config \
    build-essential \
    apt-utils \
    apt-transport-https \
    ca-certificates \
    git
RUN APT_INSTALL="apt-get install -y --no-install-recommends" && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 && \
    apt-add-repository https://cli.github.com/packages && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
    gh
RUN apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* ~/*

COPY entry.sh /usr/local/bin/entry.sh
RUN chmod +x /usr/local/bin/entry.sh

ENTRYPOINT /usr/local/bin/entry.sh
CMD ["/bin/bash", "/usr/local/bin/entry.sh"]
