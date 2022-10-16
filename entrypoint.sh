#!/usr/bin/env sh
# wrapper for docker entrypoint that takes into account the PORT env var

if [ -z "$MINIO_OPTS" ]; then
MINIO_OPTS="--console-address ':10000' --address ':443' /data"
fi

exec minio server $MINIO_OPTS
