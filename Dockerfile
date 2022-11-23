FROM alpine:3.17.0

RUN mkdir -p ~/.ssh \
    && chmod 700 ~/.ssh

RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk add --update --no-cache \
        bash \
        ca-certificates \
        curl \
        py3-setuptools \
        httpie \
        openssh \
        git \
        jq \
        yq \
        moreutils

COPY utils/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["/bin/bash"]
