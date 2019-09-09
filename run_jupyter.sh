#!/bin/bash

JUPYTER_PORT=$1
NAME=$(basename `pwd`)

if [ -z "${JUPYTER_PORT}" ]; then
  JUPYTER_PORT=8888
fi

echo "NAME         = ${NAME}"
echo "JUPYTER_PORT = ${JUPYTER_PORT}"

docker build -t ${NAME,,} --build-arg JUPYTER_PORT=${JUPYTER_PORT} ./docker
docker run --rm -it --name=${NAME,,} -p ${JUPYTER_PORT}:${JUPYTER_PORT} -v `pwd`:/work/${NAME} ${NAME,,}

