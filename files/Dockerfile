FROM python:3.9.2-slim-buster

RUN apt-get update && \
  apt-get install -y --no-install-recommends gosu && \
  rm -fr /var/lib/apt/lists/*
  
RUN python3 -m venv /venv

COPY ./requirements.txt /
RUN /venv/bin/python3 -m pip install --no-cache-dir -r /requirements.txt

COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
