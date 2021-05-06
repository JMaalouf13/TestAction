FROM ubuntu 18:04

ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    LANGUAGE=en_US:en

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && apt-get install -y curl && \
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && \
chmod a+rx /usr/local/bin/youtube-dl && \
apt-get install -y python && \
LC_ALL=C.UTF-8 youtube-dl https://www.youtube.com/watch?v=e1QHKf31Hnc && \
export LC_ALL=C.UTF-8 && \
youtube-dl https://imgur.com/JY5tHqr



# # Copy init script, set workdir & entrypoint
COPY init /init
WORKDIR /workdir
ENTRYPOINT ["/init"]

