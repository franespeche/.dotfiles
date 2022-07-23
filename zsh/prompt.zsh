# docs: https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
#				https://dev.to/cassidoo/customizing-my-zsh-prompt-3417
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST

# PROMPT='%F{white}[%*]%f %F{blue}%1~%f·%F{green}${vcs_info_msg_0_}%f '
PROMPT='%F{blue}%1~%f·%F{green}${vcs_info_msg_0_}%f%F{blue}➜%f '
