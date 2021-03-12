#!/bin/bash


USERID="${USERID-1000}"
GROUPID="${GROUPID-1000}"

groupadd --gid ${GROUPID} certbot
useradd --uid ${USERID} --gid ${GROUPID} --home-dir /home/certbot --no-create-home --shell /bin/bash certbot

OBTAIN_OPTS="--quiet --agree-tos --no-eff-email --dns-google --dns-google-credentials /run/secrets/google-credentials-file"

export PATH="/venv/bin:${PATH}"

case "$1" in
  certbot)
    case "$2" in
      certonly)
        gosu certbot:certbot "$@" ${OBTAIN_OPTS}
        ;;
      *)
        gosu certbot:certbot "$@"
        ;;
    esac
    ;;
  *)
    exec "$@"
    ;;
esac
