# Copyright (c) 2019 Sebastian Gniazdowski
# License MIT

# According to the Zsh Plugin Standard:
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

autoload -Uz →za-as-monitor-preinit-handler

# An empty stub to fill the help handler fields
→za-as-monitor-help-null-handler() { :; }

@zinit-register-annex "z-a-as-monitor" \
    hook:preinit \
    →za-as-monitor-preinit-handler \
    →za-as-monitor-help-null-handler \
    "dlink''|.monitor''" # The ice conflict with dl'' from z-a-patch-dl is being handled
                       # in the other annex

# vim:ft=zsh:tw=80:sw=4:sts=4:et
