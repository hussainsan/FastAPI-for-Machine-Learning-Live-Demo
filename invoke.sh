#!/bin/bash

echo Enter your prompt:
read prompt
#test_output=$(echo -n "$prompt" | curl -Gso /dev/null -w %{url_effective} --data-urlencode @- "")
echo $prompt

# Encode the prompt for URL

encoded_prompt=$(python -c "import urllib.parse; print(urllib.parse.quote('$prompt'))")
echo "Encoded prompt for URL: $encoded_prompt"

curl -X 'GET' \
  "http://127.0.0.1:8000/generate-memory?prompt=$prompt" \
  -H 'accept: image/png' \
  -o output.png
