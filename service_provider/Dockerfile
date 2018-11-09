FROM python:3.6.6
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "pkg-config"]
RUN ["apt-get", "install", "-y", "libxmlsec1-dev"]
RUN ["apt-get", "install", "-y", "xmlsec1"]
RUN ["apt-get", "install", "-y", "vim"]
RUN ["apt-get", "install", "-y", "nano"]

ENV PYTHONUNBUFFERED 1
RUN export ARCHFLAGS='-arch x86_64'

# Requirements have to be pulled and installed here, otherwise caching won't work

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt \
  && groupadd -r django \
  && useradd -r -g django django

COPY . /app
RUN chown -R django /app

RUN mkdir -p /logs
RUN chown -R django:django /logs

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh \
  && chown django /entrypoint.sh

WORKDIR /app

EXPOSE 8000
ENTRYPOINT ["/entrypoint.sh"]