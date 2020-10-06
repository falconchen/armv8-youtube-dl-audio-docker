#
# Dockerfile for youtube-dl
#

FROM arm64v8/python:3-alpine
#FROM aarch64/python:3.5-alpine
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apk add --no-cache ca-certificates \
                          ffmpeg \
                          openssl \
                          aria2 \
    && pip install --upgrade pip \
    && pip install youtube-dl \
    && mkdir -p /audios

# Try to run it so we know it works
RUN youtube-dl --version

WORKDIR /data

VOLUME ["/audios"]
ENTRYPOINT ["youtube-dl","-o","/audios/%(title)s.%(ext)s","-f","bestaudio"]
CMD ["--help"]
