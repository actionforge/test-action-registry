FROM alpine:3.19.0

LABEL org.opencontainers.image.title "Test Action Docker Registry"
LABEL org.opencontainers.image.version {{img.version}}
LABEL org.opencontainers.image.source {{img.source}}

COPY bin-container.sh .
RUN apk add --no-cache bash

ENTRYPOINT ["bash", "/bin-container.sh"]