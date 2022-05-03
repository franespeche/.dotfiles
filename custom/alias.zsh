
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                    Env Variables                        #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

MUSIC_BOT_DIRECTORY=~/voice/examples/music-bot
CHROME_EXTENSION_DIRECTORY=/Users/franespeche/ecommerce-catalog
DARK_MODE_SCRIPT_EXEC=~/.oh-my-zsh/custom/dark.sh

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                       Styling                           #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Color mapping
grey='\033[1;30m'
red='\033[0;31m'
RED='\033[1;31m'
green='\033[0;32m'
GREEN='\033[1;32m'
yellow='\033[0;33m'
YELLOW='\033[1;33m'
purple='\033[0;35m'
PURPLE='\033[1;35m'
white='\033[0;37m'
WHITE='\033[1;37m'
blue='\033[0;34m'
BLUE='\033[1;34m'
cyan='\033[0;36m'
CYAN='\033[1;36m'
NC='\033[0m'

DRAWING="
          $purple       -                                                - \n
          -    -                     .        $green      -.-               \n
          $purple -                         $green            -- - - -             \n
          $purple-                          $green              --.-             \n
             $purple          /$green\                             $purple          \n
-  --- -- ---- - ----/   $green;\ $purple-- - -- -    -   --  -   ----  - --- -  -   --  \n
            .      /      $green';\  $purple     .                           \n
                 /         $green'.;\ $purple                    .           \n
          $purple           .                                                             \n "
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                        Prompt                           #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

function msg() {
  #echo "$blue   ➜  $cyan$1"
  echo "$blue·  ➜  $cyan$1"
  echo "·"
  # reset terminal attributes
  tput sgr0
}

function init() {
  clear
  now=$(date +"%T")
  echo $purple$DRAWING
  echo "$green$now"
  message=":: use d and -"
  echo "$purple$message"
  echo

  #for ((i=0; i<${#message}; i++))
  #do echo "after 1" | tclsh
  #  printf "$yellow${message:$i:1}"
  #done
}

# init
init

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                     Personal Use                        #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Dark Mode script
function dark() {
  msg "switch Dark/Light mode"
  $DARK_MODE_SCRIPT_EXEC
}

# Terminal aliases
alias cursor="changeDirectory ~/.oh-my-zsh/custom/cursor"
alias p=python3
alias pyl=py3install
alias c=clear
alias ll='ls -la'
alias ls='exa --icons --tree --level 1'
alias va='vim ~/.oh-my-zsh/custom/alias.zsh'
alias vg='vim ~/.oh-my-zsh/plugins/git/git.plugin.zsh'
alias vz='vim ~/.zshrc'
alias reload.zsh="source ~/.zshrc"
alias reload.term="source ~/.bash_profile && source ~/.zshrc"

function buildext() {
  # Dev extension's build directory
  DEV_EXT_BUILD_DIR=~/ecommerce-catalog/packages/extensionToolkit/build

  EXTENSION_DIR_BUILD=~/Downloads/build\ 2
  EXTENSION_DIR=~/Downloads/

  rm -rf $EXTENSION_DIR_BUILD
  mkdir "build 2"
  mv $DEV_EXT_BUILD_DIR $EXTENSION_DIR_BUILD
  msg "done :)"
}
function py3install() {
  msg "python3 -m pip install --upgrade $1"
  python3 -m pip install --upgrade $1
}

function ra() {
  msg "reload .zshrc"
  exec zsh
# omz reload
#  reload.zsh
#  msg "reload .bash_profile"
#  reload.term
}

# Terminal Navigation
function changeDirectory() {
  msg "cd $1"
  cd "$1"
}

alias cds="changeDirectory ~/scaleapi/crawler-providers/"
alias cde="changeDirectory ~/scraper-extractors/"
alias cdt="changeDirectory ~/scaleapi/scraper-toolkit"
alias cdx="changeDirectory ~/ecommerce-catalog"

# Init
function bot() {
  START="start"
  if [[ "$1" = "start" ]]
  then
    cd $MUSIC_BOT_DIRECTORY
    msg "start music bot"
    yarn start
  else
    msg "uknown command \"$1\""
  fi
}


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                         GIT                             #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

function gcob() {
  msg "git checkout -b $1"
  git checkout -b $1
}

function gcmsg() {
  msg "git commit -m $1"
  git commit -m $1
}

function gcgs() {
  msg "git checkout provider/generalScraper__$1"
  git checkout provider/generalScraper__"$1"
}

function gcgsb() {
  msg "git checkout -b provider/generalScraper__$1"
  git checkout -b provider/generalScraper__"$1"
}

function gce() {
  msg "git commit --allow-empty -m \"$1\""
  git commit --allow-empty -m "$1"
}

function glom() {
  msg "git pull origin main"
  git pull origin main
}

function gsh() {
  msg "git stash"
  git stash
}

function gl() {
  msg "git pull"
  git pull
}

function gp() {
  msg "git push"
  git push
}

function gsw() {
  msg "git switch -"
  git switch -
}

function gpsu() {
  CURRENT=`git_current_branch`
  msg "git push --set-upstream $CURRENT"
  git push --set-upstream origin $CURRENT
}

function gf() {
  msg "git fetch"
  git fetch
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                       Sraping                           #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

function ys() {
  pwd=`pwd`
  if [[ $pwd = $CHROME_EXTENSION_DIRECTORY ]]
  then
    msg "yarn start extension-toolkit (just frontend)"
    npm start serve:extension-toolkit
  else
    msg "yarn scrape"
    yarn scrape
  fi
}
