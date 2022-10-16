#!/usr/bin/env sh
# wrapper for docker entrypoint that takes into account the PORT env var

if [ -z "$MINIO_OPTS" ]; then
exec minio server --console-address ":10000" --address ":80" /data;
else
exec minio server $MINIO_OPTS --console-address ":10000" --address ":80";
fi
