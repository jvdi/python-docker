FROM python:3.11-alpine

RUN set -xe \
    && apk add --no-cache --purge -uU \
        supervisor \
    && sed -i -e 's/^root::/root:!:/' /etc/shadow \
    && rm -rf /var/cache/apk/* /tmp/*

RUN mkdir -p /app

ENTRYPOINT ["supervisord"]

CMD ["--nodaemon", "--configuration", "/etc/supervisord.conf"]
