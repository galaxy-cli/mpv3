#!/bin/bash
#        _ __ ___  _ ____   _____| |__ 
#       | '_ ` _ \| '_ \ \ / / __| '_ \ 
#       | | | | | | |_) \ V /\__ \ | | |
#       |_| |_| |_| .__/ \_(_)___/_| |_|
#                 |_|        
# https://github.com/galaxey-cli/mpv
# mpv3.sh - Text-to-speech and playback utility using Festival, LAME, and MPV

# Dependency checks
command -v festival >/dev/null 2>&1 || { echo "festival not found"; exit 1; }
command -v xsel     >/dev/null 2>&1 || { echo "xsel not found"; exit 1; }
command -v lame     >/dev/null 2>&1 || { echo "lame not found"; exit 1; }
command -v mpv      >/dev/null 2>&1 || { echo "mpv not found"; exit 1; }

# Edit Festival speed by changing Duration_Stretch in:
# /usr/share/festival/voices/english/kal_diphone/festvox/kal_diphone.scm
# Line 265: (Parameter.set 'Duration_Stretch 0.8)

print_usage() {
    cat <<EOF
USAGE
  ./mpv3.sh -x           # Play clipboard contents
  ./mpv3.sh -o FILE      # Play contents of FILE
  ./mpv3.sh -e           # Play user input (one line)
  ./mpv3.sh -t           # Play output from tgpt

FLAGS
  -x    Use clipboard (xsel)
  -o    Open and play a file
  -e    Echo user input
  -t    Use tgpt output
EOF
}

# Store temporary script files in /tmp/
textfile=$(mktemp /tmp/mpv3_text.XXXXXX)
mp3file=$(mktemp /tmp/mpv3_audio.XXXXXX.mp3)
trap 'rm -f "$textfile" "$mp3file"' INT EXIT

text2lame() {
    text2wave "$textfile" | lame - "$mp3file"
    mpv "$mp3file"
}

mpv_clipboard() {
    xsel > "$textfile"
    text2lame
}

mpv_file() {
    open "$1" && cat "$1" > "$textfile"
    text2lame
}

mpv_input() {
    read -r input
    echo "$input" > "$textfile"
    text2lame
}

mpv_tgpt() {
    command -v tgpt >/dev/null 2>&1 || { echo "tgpt not found"; exit 1; }
    tgpt > "$textfile"
    open "$textfile"
    text2lame
}

case "${1:-}" in
    -x) mpv_clipboard ;;
    -o) mpv_file "${2:-}" ;;
    -e) mpv_input ;;
    -t) mpv_tgpt ;;
    *)  print_usage ;;
esac
