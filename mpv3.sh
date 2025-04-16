#!/bin/bash
#############
#           #
#  mpv3.sh  #
#           #
#############

trapmpv(){

	trap "rm -f mpv3; rm -f mpv3.mp3" INT EXIT

}

text2lame(){

	text2wave mpv3 | lame - mpv3.mp3 

}

openmpv(){

	mpv mpv3.mp3

}

case "$1" in

	-x) trapmpv; xsel > mpv3; text2lame; openmpv ;;

	-o) trapmpv; open "$2" && cat "$2" > mpv3; text2lame; openmpv ;;

	-e) trapmpv; read mpv3; echo "$mpv3" > mpv3; text2lame; openmpv ;;

	-t) trapmpv; tgpt > mpv3; text2lame; open mpv3; openmpv ;;

	*)
		printf "USAGE\n"

		printf "mpv3 -x [XSEL]\n"

		printf "mpv3 -o [OPEN FILE]\n"

		printf "mpv3 -e [ECHO]\n"

		printf "mpv3 -t [TGPT]\n"

esac
