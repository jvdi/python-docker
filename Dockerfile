FROM python:3.11-alpine

RUN set -xe \
    && apk add --no-cache --purge -uU \
        supervisor \
        tzdata \
        curl \
    && sed -i -e 's/^root::/root:!:/' /etc/shadow \
    && rm -rf /var/cache/apk/* /tmp/*

RUN mkdir -p /app

ENV TZ=UTC
RUN cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENTRYPOINT ["supervisord"]

CMD ["--nodaemon", "--configuration", "/etc/supervisord.conf"]
