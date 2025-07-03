#!/bin/bash
#
#       | |_| |_ ___   ___| |__   | |__  _   _    __ _  __ _| | __ ___  ___   _        ___| (_)
#       | __| __/ __| / __| '_ \  | '_ \| | | |  / _` |/ _` | |/ _` \ \/ / | | |_____ / __| | |
#       | |_| |_\__ \_\__ \ | | | | |_) | |_| | | (_| | (_| | | (_| |>  <| |_| |_____| (__| | |
#        \__|\__|___(_)___/_| |_| |_.__/ \__, |  \__, |\__,_|_|\__,_/_/\_\\__, |      \___|_|_|
#                                        |___/   |___/                    |___/
# https://github.com/galaxey-cli/tts
# tts.sh - Simple text-to-speech utility using Festival and optional GPT integration

# Updates repos and installs relevant packages for tts.sh
sudo apt update
sudo apt install -y mpv festival xsel git

# Check if tgpt directory exists before cloning and installing
if [ -d tgpt ]; then
    echo "tgpt is already installed (directory exists). Skipping clone and install."
else
    git clone https://github.com/aandrew-me/tgpt.git
    sh tgpt/install
fi
