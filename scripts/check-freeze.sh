#!/bin/bash

echo "Checking business calendar freeze..."

STATUS=$(curl -s -o /dev/null -w "%{http_code}" https://example.com/api/deployment-freeze)

if [ "$STATUS" -eq 200 ]; then
  echo "Deployment allowed"
  exit 0
elif [ "$STATUS" -eq 403 ]; then
  echo "Deployment blocked: Business freeze active"
  exit 1
else
  echo "Unexpected response from freeze API"
  exit 1
fi