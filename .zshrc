autoload -Uz vcs_info
precmd() { vcs_info }
autoload -Uz compinit && compinit

export PATH="$HOME/.jenv/bin:/Users/dan/bin:/Users/dan/go/bin:/usr/local/bin/apache-maven-3.6.3/bin:/opt/homebrew/opt/libpq/bin:$PATH"

### Zinit
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
zinit light ohmyzsh/ohmyzsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::command-not-found

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

export EDITOR="/opt/homebrew/bin/nvim"
export LSCOLORS="exfxcxdxbxegedabagexex"
export BAT_THEME="base16"
PROMPT='%F{cyan}%d %F{red}${vcs_info_msg_0_}%f %F{yellow}→%f '
# aliases
alias k="kubectl"
alias vim="nvim"
alias vi="nvim"
  ## sk with preview
alias skim="sk --preview='bat {} --color=always' -m"
cdf() {
    cd "$(fd -t d | sk --preview='eza -TL 2 --color=always {}')"
}
alias cat='bat --paging=never --style=plain'
alias ls='eza'
alias ll='eza -l'
alias cd='z'
alias du='dust -r'
eval "$(zoxide init zsh)"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
