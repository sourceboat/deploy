FROM alpine:3.8

RUN apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    openssh

CMD ["/bin/bash"]
