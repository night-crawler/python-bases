FROM python:3.6.4-slim-stretch

ENV BUILD_DEPS \
    build-essential

ENV RUN_DEPS \
    gettext \
    libhiredis0.13 \
    git-core

RUN apt-get update \
 && apt-get --assume-yes upgrade \
 && pip3 install wheel \
 && apt-get install --no-install-recommends --assume-yes ${BUILD_DEPS} ${RUN_DEPS} \
 && apt-get autoremove --assume-yes \
 && apt-get autoclean \
 && apt-get clean
