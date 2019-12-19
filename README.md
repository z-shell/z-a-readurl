# z-a-as-track

## Introduction

This Zplugin extension allows to automatically download the newest version of
a file to which URL is hosted on a webpage.

It works as follows:

- invoke `snippet` (or simply pass the URL using the `for` syntax) on the URL of
  the page that hosts the URL to the file to download,
- provide `dlink''` ice with the expected file-download URL replacing the version
  with the `%VERSION%` keyword,
- also provide `as''` ice with one of the following values: `track`,
  `track|command`, `track|completion`, `track|null`; the part after the `|` has
  the same meaning as in the normal `as''` ice.

So, for example:

```zsh
zplugin id-as'fzf' as'track|command' atclone'zpextract fzf tgz' \
    dlink'/junegunn/fzf-bin/releases/download/%VERSION%/fzf-%VERSION%-linux_amd64.tgz' \
        for https://github.com/junegunn/fzf-bin/releases/
```

The snippet is just an example. The same effect is obtained by loading as
`junegunn/fzf-bin` plugin with `from'gh-r'` ice.

As it can be seen, the `dlink''` can be a relative or an absolute path and also
a full URL (i.e.: beginning with the `http://…` prefix).

## Installation

Simply load like a regular plugin, i.e.:

```zsh
zplugin light zplugin/z-a-as-track
```

<!-- vim:set ft=markdown tw=80 fo+=a1n autoindent:  -->
