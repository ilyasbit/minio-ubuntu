#!/usr/bin/env sh
# wrapper for docker entrypoint that takes into account the PORT env var

exec minio server --console-address ":10000" --address ":9000" /data
