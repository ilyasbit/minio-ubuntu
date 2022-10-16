FROM ubuntu:latest

EXPOSE 443 10000

RUN DEBIAN_FRONTEND=noninteractive apt update -y && \
    DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y sudo dnsutils nano inetutils-ping cron jq unzip progress software-properties-common ca-certificates screen htop nload wget curl aria2 gnupg lsb-release
RUN curl https://rclone.org/install.sh | bash
RUN wget https://dl.minio.io/server/minio/release/linux-amd64/minio -O /usr/local/bin/minio && chmod +x /usr/local/bin/minio


COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
COPY private.key /root/.minio/certs
COPY public.crt /root/.minio/certs
USER root:root

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
