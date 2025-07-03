#!/bin/bash
#        _ __ ___  _ ____   _____| |__ 
#       | '_ ` _ \| '_ \ \ / / __| '_ \ 
#       | | | | | | |_) \ V /\__ \ | | |
#       |_| |_| |_| .__/ \_(_)___/_| |_|
#                 |_|
# https://github.com/galaxey-cli/mpv
# mpv3.sh - Text-to-speech and playback utility using Festival, LAME, and MPV

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
