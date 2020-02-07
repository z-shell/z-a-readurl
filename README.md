# z-a-as-monitor

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Introduction](#introduction)
- [Intermediate Download Page](#intermediate-download-page)
- [Skipping `dlink''` Ice](#skipping-dlink-ice)
- [Summary](#summary)
- [Installation](#installation)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Introduction

This Zinit extension allows to automatically download the newest version of
a file to which URL is hosted on a webpage.

It works as follows:

- invoke `snippet` (or simply pass the `http://…` address using the `for`
  syntax) on the web-page that hosts the URL to the file to download,
- provide `dlink''` ice with the expected file-download URL replacing the version
  with the `%VERSION%` keyword,
- also provide `as''` ice with one of the following values: `monitor`,
  `monitor|command`, `monitor|completion`, `monitor|null`; the part after the `|` has
  the same meaning as in the normal `as''` ice.

So, for example:

```zsh
zinit id-as=fzf as='monitor|command' extract \
    dlink='/junegunn/fzf-bin/releases/download/%VERSION%/fzf-%VERSION%-linux_amd64.tgz' \
        is-snippet for https://github.com/junegunn/fzf-bin/releases/
```

The snippet is just an example. The same effect is obtained by loading as
`junegunn/fzf-bin` plugin with `from'gh-r'` ice.

As it can be seen, the `dlink''` can be a relative or an absolute path and also
a full URL (i.e.: beginning with the `http://…` prefix).

## Intermediate Download Page

Sometimes, like it is in case of
[terraform](http://releases.hashicorp.com/terraform) command, the final download
link isn't at the download page, but on a page that's listed on it. In such case
use the `dlink0''` ice to provide the pattern for the second download page. For
example, in case of `terraform`, the Zinit command is:

```zsh
zinit id-as=terraform as='monitor|command' extract \
    dlink0='/terraform/%VERSION%/' \
    dlink='/terraform/%VERSION%/terraform_%VERSION%_linux_386.zip' \
    is-snippet for \
        http://releases.hashicorp.com/terraform/
```

## Skipping `dlink''` Ice

Sometimes the URL of the download page differs from the URL of the archive in
just a few `/`-sections. In such case, it is possible to skip the `dlink''` ice
by appending a `++`-separated fragment of the archive URL, like so:

```zsh
zinit as'monitor|command' extract \
        is-snippet for \
            http://domain.com/download-page++/archive.zip
```

If the archive URL has some different `/`-sections, then it's possible to strip
the conflicting ones from the download URL by using `+++`, `++++`, etc. – the
number of the `/`-section that'll be stripped equals to the number of the `+`
minus
2. So, for example:

```zsh
zinit as'monitor|command' extract \
    is-snippet for \
        http://domain.com/download-page/removed-section+++/archive.zip
```

## Summary

The annex provides:

1.  Two new ices: `dlink''` and `dlink0''`.
2.  A handling of the special values of the `as''` ice, i.e.: of `as'monitor'`,
    `as'monitor|command'`, etc.

The annex works only with snippets, not plugins.

## Installation

Simply load like a regular plugin, i.e.:

```zsh
zinit light zinit-zsh/z-a-as-monitor
```

After executing the above command (possibly via `zshrc`) it's then possible to
use the `dlink''` and `dlink0''` ices and also the special `as'monitor…'` value of
the `as''` ice.

<!-- vim:set ft=markdown tw=80 fo+=a1n autoindent:  -->
