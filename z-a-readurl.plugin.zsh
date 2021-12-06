# Copyright (c) 2019-2020 Sebastian Gniazdowski
# Copyright (c) 2021 Z-Shell ZI Contributors
#
# According to the Zsh Plugin Standard:
# https://z-shell.github.io/ZSH-TOP-100/Zsh-Plugin-Standard.html

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

autoload -Uz za-readurl-preinit-handler

# An empty stub to fill the help handler fields
za-readurl-help-null-handler() { :; }

@zinit-register-annex "z-a-readurl" hook:preinit-10 \
za-readurl-preinit-handler za-readurl-help-null-handler \
"dlink''|.readurl''" # The ice conflict with dl'' from z-a-patch-dl is being handled in the other annex
