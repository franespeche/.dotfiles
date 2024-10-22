# # # # # # # # # # # #
#         git         #
# # # # # # # # # # # #

alias gss='git status'
alias ga='git add'
alias gco='git checkout'
alias gg="lazygit"
alias glol='git log --graph --oneline --decorate'
# open all git modified files in vim
alias vimgit="vim -O $(git status --porcelain | awk '{print $2}')"

# restore file from staging area
function grs() {
  msg "git restore --staged"
  # variables
  declare -A dictionary
  stagedFiles=$(git diff --name-only --cached)
  i=0

  echo "$green:: choose a file to restore from staging area"

  echo $stagedFiles |
    while read x; do
      i=$[$i + 1]
      echo "  $i. $x"
      dict[$i]=$x
    done

 i=$[$i + 1]
 dict[$i]="exit"
 echo "  $i. exit"

  #prompt
  read -s file
  echo

  if [[ ${dict[$file]} == "exit" ]] then
    return
  fi

  { #try
      git restore --staged ${dict[$file]} &&
      echo "  ➜ $white ${dict[$file]}$yellow restored from staging area"
  } || { # catch
      echo "failed to restore file ${dict[$file]}"
  }
}

function removeLocalAndRemoteBranch() {
  # remove local
  git branch -D $1 &&
    msg "deleted local branch $1"

  # remove remote
  git push origin --delete $1 &&
    msg "deleted remote branch $1"
}

function gcob() {
  msg "git checkout -b $1"
  git checkout -b $1
}


function gcmsg() {
  msg "git commit -m $1"
  git commit -m $1
}

function gce() {
  msg "git commit --allow-empty -m \"$1\""
  git commit --allow-empty -m "$1"
}

function gri() {
  if [[ $# == 0 ]]; then
    exit 1
  fi
  msg "git rebase -i HEAD~\"$1\""
  git rebase -i HEAD~"$1"
}

function glom() {
  msg "git pull origin main"
  git pull origin main
}

function gsh() {
  msg "git stash"
  git stash
}

function gshp() {
  msg "git stash pop"
  git stash pop
}

function gl() {
  msg "git log"
  git log --pretty=oneline
}

# function gl() {
  # msg "git log"
  # git log
# }

function gp() {
  msg "git pull"
  git pull
}

function gP() {
  msg "git push"
  git push
}

function g-() {
  msg "git switch -"
  git switch -
}

function gf() {
  msg "git fetch"
  git fetch
}
