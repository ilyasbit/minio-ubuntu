#!/usr/bin/env sh
# wrapper for docker entrypoint that takes into account the PORT env var

if [ -z "" ]; then
exec minio server --console-address ":10000" --address ":443" /data;
else
exec minio server $MINIO_OPTS --console-address ":10000" --address ":443";
fi
