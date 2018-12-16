FROM ubuntu:18.04

MAINTAINER PavoLab <https://github.com/pavolab>

ENV WORKDIR=/home/warband/dedicated

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y wget software-properties-common apt-transport-https bsdtar dos2unix curl \
    && wget -qO - https://dl.winehq.org/wine-builds/Release.key | apt-key add - \
    && apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/ \
    && apt-get update \
    && apt-get install -y --install-recommends winehq-stable \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/{apt,dpkg,cache,log} /tmp/* \
    && groupadd warband && useradd -m -g warband warband

WORKDIR ${WORKDIR}
COPY --chown=warband:warband ./ .
USER warband

VOLUME [ "${WORKDIR}" ]