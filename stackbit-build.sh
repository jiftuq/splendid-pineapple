#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e832fda94f63e0019aac9e8/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e832fda94f63e0019aac9e8
curl -s -X POST https://api.stackbit.com/project/5e832fda94f63e0019aac9e8/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e832fda94f63e0019aac9e8/webhook/build/publish > /dev/null
