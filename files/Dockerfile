FROM python:3.9.2-slim-buster
LABEL org.opencontainers.image.source https://github.com/nakanod/docker-certbot-dns-google

RUN apt-get update && \
  apt-get install -y --no-install-recommends gosu && \
  rm -fr /var/lib/apt/lists/* && \
  python3 -m venv /venv

COPY ./requirements.txt /
RUN /venv/bin/python3 -m pip install --no-cache-dir -r /requirements.txt

COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
