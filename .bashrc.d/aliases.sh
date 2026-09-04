##############
##  Aliases ##
##############
if command -v nvim >/dev/null 2>&1; then
  alias vim='nvim'
  alias vi='vim'
else
  alias vim='vim'
  alias vi='vim'
fi

alias gpfo="git push --force origin"
alias gpo="git push origin"

function rdns () {
    sudo resolvectl flush-caches
    sudo systemctl restart systemd-resolved
}
