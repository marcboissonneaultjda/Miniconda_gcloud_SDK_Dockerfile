From debian:wheezy
MAINTAINER Marc Boissonneault <marc.boissonneault@jda.com>

ENV LANG C.UTF-8

ENV MINICONDA_VERSION 3.7.0
ENV PATH /opt/miniconda/bin:$PATH

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y bzip2 curl unzip && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN curl -o /tmp/miniconda.sh http://repo.continuum.io/miniconda/Miniconda-$MINICONDA_VERSION-Linux-x86_64.sh && bash /tmp/miniconda.sh -b -p /opt/miniconda && rm /tmp/miniconda.sh


ENV CLOUDSDK_PYTHON_SITEPACKAGES 1
ENV PATH $PATH:/opt/google-cloud-sdk/bin
ENV PYTHONPATH /opt/google-cloud-sdk/platform/google_appengine/

RUN curl -o /tmp/google-cloud-sdk.zip https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.zip && unzip /tmp/google-cloud-sdk.zip -d /opt && rm /tmp/google-cloud-sdk.zip && /opt/google-cloud-sdk/install.sh --usage-reporting false --bash-completion false --path-update false --additional-components pkg-python preview app