FROM alpine:3.8

RUN mkdir -p ~/.ssh

RUN apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    openssh

COPY utils/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["/bin/bash"]
