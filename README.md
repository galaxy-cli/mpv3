# SETUP
* Use `chmod u+x mpv.sh` to make the script executable
* Use `./mpv` to run script
# USAGE
>  `mpv3 --clip [--speed NUM] [--play-once] [--no-save] [--hide-encoding]`
>  `mpv3 --file FILE [--speed NUM] [--play-once] [--no-save] [--hide-encoding]`
>  `mpv3 --user [--speed NUM] [--play-once] [--no-save] [--hide-encoding]`
>  `mpv3 --tgpt [--speed NUM] [--play-once] [--no-save] [--hide-encoding]`
# FLAGS
-  `--clip`	      Use clipboard (xsel)
-  `--file`	      Open and play a file
-  `--user`	      Echo user input
-  `--tgpt`	      Use tgpt output
-  `--speed`	      Set TTS speed (Festival Duration_Stretch, e.g. 0.5 = faster, 1.5 = slower)
-  `--play-once`      Play audio once, skip replay prompt
-  `--no-save`	      Skip prompt to save the MP3 file
-  `--hide-encoding`  Hide encoding progress/output when encoding MP3
