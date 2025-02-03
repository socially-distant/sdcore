FROM quay.io/almalinuxorg/almalinux-bootc:latest

COPY build.sh /tmp/build.sh

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
    