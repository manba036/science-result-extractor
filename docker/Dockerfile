FROM ubuntu:18.04

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  build-essential \
  wget \
  curl \
  file \
  sudo \
  unzip \
  git \
  python3 \
  python3-pip \
  python3-dev

RUN apt-get install -y nodejs npm

RUN pip3 install --upgrade pip
RUN pip3 install setuptools
RUN pip3 install jupyterlab ipywidgets
RUN jupyter nbextension enable --py widgetsnbextension \
 && jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build \
 && jupyter labextension install @jupyterlab/plotly-extension --no-build \
 && jupyter lab build

COPY ./requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt

RUN mkdir /work
WORKDIR /work

RUN apt-get install -y openjdk-8-jdk
RUN export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jdk/bin/"

RUN wget https://github.com/kermitt2/grobid/archive/0.5.3.zip -O /work/0.5.3.zip \
 && unzip /work/0.5.3.zip \
 && cd /work/grobid-0.5.3/ \
 && ./gradlew clean install \
 && rm -f /work/0.5.3.zip

ARG JUPYTER_PORT
ENV ENV_JUPYTER_PORT $JUPYTER_PORT

EXPOSE $ENV_JUPYTER_PORT

CMD jupyter lab --port=${ENV_JUPYTER_PORT} --ip=0.0.0.0 --allow-root --no-browser
