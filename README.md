# z-a-as-track

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [z-a-as-track](#z-a-as-track)
  - [Introduction](#introduction)
  - [Intermediate Download Page](#intermediate-download-page)
  - [Skipping `dlink''` Ice](#skipping-dlink-ice)
  - [Installation](#installation)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Introduction

This Zplugin extension allows to automatically download the newest version of
a file to which URL is hosted on a webpage.

It works as follows:

- invoke `snippet` (or simply pass the `http://…` address using the `for`
  syntax) on the web-page that hosts the URL to the file to download,
- provide `dlink''` ice with the expected file-download URL replacing the version
  with the `%VERSION%` keyword,
- also provide `as''` ice with one of the following values: `track`,
  `track|command`, `track|completion`, `track|null`; the part after the `|` has
  the same meaning as in the normal `as''` ice.

So, for example:

```zsh
zplugin id-as=fzf as='track|command' atclone='zpextract fzf tgz' \
    dlink='/junegunn/fzf-bin/releases/download/%VERSION%/fzf-%VERSION%-linux_amd64.tgz' \
        for https://github.com/junegunn/fzf-bin/releases/
```

The snippet is just an example. The same effect is obtained by loading as
`junegunn/fzf-bin` plugin with `from'gh-r'` ice.

As it can be seen, the `dlink''` can be a relative or an absolute path and also
a full URL (i.e.: beginning with the `http://…` prefix).

## Intermediate Download Page

Sometimes, like it is in case of
[terraform](http://releases.hashicorp.com/terraform) command, the final download
link isn't at the download page, but on a page that's listed on it. In such case
use the `dlink0''` ice to provide the pattern for the final download page. For
example, in case of `terraform`, the Zplugin command is:

```zsh
zplugin id-as=terraform atclone='zpextract terraform zip' as='track|command' \
    atpull='%atclone' dlink0='/terraform/%VERSION%/' \
    dlink='/terraform/%VERSION%/terraform_%VERSION%_linux_386.zip' for \
        http://releases.hashicorp.com/terraform/
```

## Skipping `dlink''` Ice

Sometimes the URL of the download page differs from the URL of the archive in
just a few `/`-sections. In such case, it is possible to skip the `dlink''` ice
by appending a `++`-separated fragment of the archive URL, like so:

```zsh
zplugin atclone'zpextract *.zip' as'track|command' atpull'%atclone' for \
        http://domain.com/download-page++/archive.zip
```

If the archive URL has some different `/`-sections, then it's possible to strip
the conflicting ones from the download URL by using `+++`, `++++`, etc. – the
number of the `/`-section that'll be stripped equals to the number of the `+`
minus
2. So, for example:

```zsh
zplugin atclone'zpextract *.zip' as'track|command' atpull'%atclone' for \
    http://domain.com/download-page/removed-section+++/archive.zip
```

## Installation

Simply load like a regular plugin, i.e.:

```zsh
zplugin light zplugin/z-a-as-track
```

<!-- vim:set ft=markdown tw=80 fo+=a1n autoindent:  -->
