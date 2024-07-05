FROM python:3.11-alpine

RUN set -xe \
    && apk add --no-cache --purge -uU \
        supervisor \
        tzdata \
        curl \
    && sed -i -e 's/^root::/root:!:/' /etc/shadow \
    && rm -rf /var/cache/apk/* /tmp/*

RUN mkdir -p /app

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["--nodaemon", "--configuration", "/etc/supervisord.conf"]