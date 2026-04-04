# mpv3
A lightweight CLI utility that converts text from strings, files, or the clipboard into MP3 audio for instant playback and saving.

### Prerequisites
    Festival: The speech synthesis engine
    Lame: High-quality MP3 encoder
    MPV: Media player for instant playback
    xsel: Required for clipboard functionality
### Installation
```
chmod +x mpv3
mv mpv3 ~/.local/bin/          # Or anywhere in your $PATH
```

### Usage
```
mpv3 -s "Hello world"          # Speak a direct string
mpv3 -f notes.txt              # Convert a text file
mpv3 -c                        # Read from your clipboard
```

### Options
| Option | Argument | Description |
| :--- | :---: | :--- |
| `-h, --help` | None | Show this help message |
| `-c, --clipboard` | None | Speak text from the clipboard |
| `-f, --file` | `FILE` | Speak content from a plaintext file |
| `-s, --speak` | `TEXT` | Speak a quoted string directly |