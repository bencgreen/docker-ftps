FROM bcgdesign/alpine-s6:alpine-3.13-1.5.0

LABEL maintainer="Ben Green <ben@bcgdesign.com>" \
    org.label-schema.name="FTPS" \
    org.label-schema.version="latest" \
    org.label-schema.vendor="Ben Green" \
    org.label-schema.schema-version="1.0"

EXPOSE 21 990 18700-18710

ENV \
    # the external IP address of the server
    EXTERNAL_IP= \
    # the external URI of the server (takes precedence over EXTERNAL_IP - but you must use one or the other)
    EXTERNAL_URI= \
    # the number of bits for the SSL certificate
    SSL_BITS=4096

COPY ./overlay /
COPY ./VSFTPD_BUILD /tmp/VERSION

RUN bcg-install

VOLUME [ "/files", "/ssl" ]
