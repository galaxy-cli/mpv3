# mpv3

A minimalist, high-performance CLI utility that converts plaintext documents into accelerated MP3 audio tracks using the Festival TTS engine and LAME, streaming the results directly into `mpv`.

This tool adheres to strict **GNU/POSIX standards** for argument parsing and follows **Semantic Versioning (v1.0.0)**. It speeds up the text-to-speech cadence using an optimized pacing multiplier (`0.7`) to deliver a smooth, efficient listening experience.

## Prerequisites

Before running the script, ensure you have the required core utilities installed on your system.

### Debian / Ubuntu
```bash
sudo apt update && sudo apt install festival lame mpv
```

### Fedora / RHEL
```bash
sudo dnf install festival lame mpv
```

### Arch Linux
```bash
sudo pacman -S festival lame mpv
```

> **Note:** The `text2wave` utility used by this script is packaged inside the core `festival` library.

## Installation

Download the script, grant it executable permissions, and move it somewhere into your system's `$PATH`:

```bash
chmod +x mpv3
mv mpv3 ~/.local/bin/ # Or anywhere else in your \$PATH layout
```

## Usage

```bash
mpv3 [OPTIONS] <plaintext_file>
```

### Examples

**Play a plain text file directly:**
```bash
mpv3 notes.txt
```

**Display version information:**
```bash
mpv3 --version
```

**Display the help menu:**
```bash
mpv3 --help
```

## Options

| Option | Long Option | Description |
| :--- | :--- | :--- |
| `-h` | `--help` | Show the help guidelines layout and exit |
| `-v` | `--version` | Output version information (SemVer 2.0.0) and exit |