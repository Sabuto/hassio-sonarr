ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8
ENV XDG_CONFIG_HOME="/config/xdg"

ARG SONARR_VERSION

RUN \
    echo "*** Install apt-transport-https ***" \
    && apt-get update \
    && apt-get install -y --no-install-recommends apt-transport-https gnupg \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
    && echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list \
    && echo "*** Install packages ***" \
    && apt-get update \
    && apt-get install -y --no-install-recommends bzip2 ca-certificates-mono libcurl4-openssl-dev mono-devel mono-vbnc python sqlite3 unzip \
    && echo "*** Cleanup ***" \
    && rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/* \
    && echo "*** Install Sonarr ***" \
    && mkdir -p /opt/NzbDrone


#COPY run.sh /
#RUN chmod a+x /run.sh

CMD [ "/bin/bash" ]
