#!/bin/bash


OBTAIN_OPTS="--quiet --agree-tos --no-eff-email --dns-google --dns-google-credentials /run/secrets/google-credentials-file"
export PATH="/venv/bin:${PATH}"

case "$1" in
  certbot)
    case "$2" in
      certonly)
        gosu ${USERID}:${GROUPID} "$@" ${OBTAIN_OPTS}
        ;;
      *)
        gosu ${USERID}:${GROUPID} "$@"
        ;;
    esac
    ;;
  *)
    exec "$@"
    ;;
esac
