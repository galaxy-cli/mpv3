# mpv3

A **Text-to-Speech (TTS) and playback utility** leveraging [Festival](http://festival.org.uk/), [LAME](https://lame.sourceforge.io/), and [MPV](https://mpv.io/) for Linux.

---

## Features

- Converts text input to speech using Festival TTS engine
- Supports input from clipboard, text files, direct text input, or via [tgpt](https://github.com/aandrew-me/tgpt)
- Adjustable speech speed (Festival Duration_Stretch parameter)
- Encodes output audio to MP3 format using LAME
- Plays audio with MPV media player
- Option to replay audio multiple times or play once
- Interactive prompts to save or discard generated MP3 file
- Option to hide encoding output for cleaner console experience
- Automatic dependency check and easy installation on Debian-based systems

---

## Installation and Dependencies

**Dependencies:** `festival`, `xsel`, `lame`, `mpv`, `tgpt` (special case, cloned from GitHub)

The script automatically detects missing dependencies and offers to install them via `apt` and by cloning tgpt from GitHub.

To install manually on Debian/Ubuntu:

```
sudo apt update
sudo apt install festival xsel lame mpv git
git clone https://github.com/aandrew-me/tgpt.git
sh tgpt/install
```
---

## Usage

mpv3 <options> [text]

text

### Options

| Flag           | Description                                                                                   |
| -------------- | ---------------------------------------------------------------------------------------------|
| `--clip`       | Use clipboard content as input                                                               |
| `--file FILE`  | Use text content from specified file                                                         |
| `--text`       | Read text input interactively from the terminal                                              |
| `--tgpt`       | Use output from the `tgpt` command                                                           |
| `--speed NUM`  | Set speech speed (`Duration_Stretch` for Festival). Less than 1 is faster, greater is slower  |
| `--play-once`  | Play audio once, do not prompt to replay                                                     |
| `--no-save`    | Skip prompt to save the generated MP3                                                        |
| `--hide-encoding`| Suppress encoding progress/output when LAME encodes the MP3                                  |

### Examples

- Play clipboard text at default speed:
`mpv3 --clip`
- Read from a file, play faster, prompt to save:
`mpv3 --file /path/to/file.txt --speed 0.7`
- Input typed text, play once, do not save file:
`mpv3 --text --play-once --no-save`

---

## Customization

You can adjust Festival's default speech speed permanently by editing:

`/usr/share/festival/voices/english/kal_diphone/festvox/kal_diphone.scm`

Change the Duration_Stretch parameter (default is 1.0):

`(Parameter.set 'Duration_Stretch 0.8)`

Lower values speed up the speech, higher values slow it down.

---

## How it works

1. The script detects the input source and obtains text accordingly.
2. Text is saved to a temporary file.
3. Festival synthesizes a WAV audio file, optionally adjusting speed.
4. LAME encodes the WAV to MP3.
5. MPV plays the MP3 audio.
6. User is prompted to replay and/or save the MP3 (unless options skip these steps).

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

## Author & Contact

**galaxy-cli**

GitHub: [https://github.com/galaxy-cli/mpv3](https://github.com/galaxy-cli/mpv3)
