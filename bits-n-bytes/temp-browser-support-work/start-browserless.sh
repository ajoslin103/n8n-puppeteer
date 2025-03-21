#!/bin/bash
docker run \
  -d  --rm \
  -p 3000:3000 \
  -e "CORS=true" \
  -e "CONCURRENT=10" \
  -e "ALLOW_FILE_PROTOCOL=true" \
  -e "TOKEN=ROCKETMORTGAGETEST" \
  --name browserless \
  ghcr.io/browserless/chromium
