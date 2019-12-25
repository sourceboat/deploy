FROM alpine:3.11.2

RUN mkdir -p ~/.ssh \
    && chmod 700 ~/.ssh

RUN apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    httpie \
    openssh \
    git

COPY utils/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["/bin/bash"]
