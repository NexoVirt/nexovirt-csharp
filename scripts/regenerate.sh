#!/usr/bin/env bash
# Regenerate this SDK from the live NexoVirt OpenAPI spec. README/LICENSE/scripts are
# preserved via .openapi-generator-ignore.
set -euo pipefail
SPEC_URL="${SPEC_URL:-https://docs.nexovirt.com/openapi.yaml}"
cd "$(dirname "$0")/.."
npx --yes @openapitools/openapi-generator-cli@2.20.0 generate \
  -i "$SPEC_URL" -g csharp -o . \
  --additional-properties=packageName=NexoVirt.Sdk,packageVersion=0.1.0,targetFramework=net8.0,library=httpclient
