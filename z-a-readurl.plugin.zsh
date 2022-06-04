# -*- mode: zsh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
# vim: ft=zsh sw=2 ts=2 et
#
# Copyright (c) 2021 Z-Shell Community
#
# According to the Zsh Plugin Standard:
# https://z.digitalclouds.dev/community/zsh_plugin_standard/#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# https://z.digitalclouds.dev/community/zsh_plugin_standard/#funtions-directory
if [[ $PMSPEC != *f* ]] {
    fpath+=( "${0:h}/functions" )
}

autoload -Uz →za-readurl-preinit-handler

# An empty stub to fill the help handler fields
→za-readurl-null-handler() { :; }

# The ice conflict with dl'' from z-a-patch-dl is being handled in the other annex
@zi-register-annex "z-a-readurl" hook:preinit-10 \
  →za-readurl-preinit-handler \
  →za-readurl-null-handler "dlink''|.readurl''"
