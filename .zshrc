setopt prompt_subst
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

export GOPATH=$HOME/Develop/go
export PATH=$PATH:$GOPATH/bin

function rprompt-git-current-branch {
  local name st color gitdir action
  if [[ "$PWD" =~ '/¥.git(/.*)?$' ]]; then
    return
  fi
  name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
  if [[ -z $name ]]; then
    return
  fi

  gitdir=`git rev-parse --git-dir 2> /dev/null`
  action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    color=%F{green}
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
    color=%F{yellow}
  elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
    color=%B%F{red}
  else
     color=%F{red}
  fi
  echo "$color$name$action%f%b "
}

# https://qiita.com/yuyuchu3333/items/84fa4e051c3325098be3
# 色の設定
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

if [ -f ~/.dircolors ]; then
    if type dircolors > /dev/null 2>&1; then
        eval $(gdircolors ~/.dircolors)
    elif type gdircolors > /dev/null 2>&1; then
        eval $(gdircolors ~/.dircolors)
    fi
fi

if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# -------------- 使い方 ---------------- #
RPROMPT='`rprompt-git-current-branch`'

#PS1="[@${HOST%%.*} %1~]%(!.#.$) " # この辺は好み

#PROMPT="%~% %F{5}[%n]%f$ "
PROMPT='[%c] '

setopt transient_rprompt          # 右側まで入力がきたら時間を消す
setopt prompt_subst               # 便利なプロント
bindkey -e                        # emacsライクなキーバインド

export LANG=ja_JP.UTF-8           # 日本語環境

autoload -U compinit              # 強力な補完機能
compinit -u                       # このあたりを使わないとzsh使ってる意味なし
setopt autopushd              # cdの履歴を表示
setopt pushd_ignore_dups          # 同ディレクトリを履歴に追加しない
setopt auto_cd                    # 自動的にディレクトリ移動
setopt list_packed      # リストを詰めて表示
setopt list_types                 # 補完一覧ファイル種別表示

# 履歴
HISTFILE=~/.zsh_history           # historyファイル
HISTSIZE=10000                    # ファイルサイズ
SAVEHIST=10000                    # saveする量
setopt hist_ignore_dups           # 重複を記録しない
setopt hist_reduce_blanks         # スペース排除
setopt share_history              # 履歴ファイルを共有
setopt EXTENDED_HISTORY           # zshの開始終了を記録

# history 操作まわり
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# alias
alias ls="gls --color"
alias beep='echo -e "\a"'
alias r='rails'
alias safari='open -a Safari'
alias chrome='open -a Gooogle\ Chrome'
alias kobito='open -a Kobito'
alias be='bundle exec'
alias g='git'
alias gcc=llvm-gcc

# zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

### add paths
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH

### rbenv setting
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

### nodebrewの設定
export PATH=$HOME/.nodebrew/current/bin:$PATH

### playのpathの設定
#export PATH=/usr/local/play:$PATH

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"

### pythonの設定
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

### for go lang
#export GOPATH=$HOME/go1.4
#export PATH=$PATH:$GOPATH/bin

### open
# alias coteditor='open $1 -a "/Applications/CotEditor.app"'
# export PATH="$HOME/.ndenv/bin:$PATH"
# eval "$(ndenv init -)"

# direnv
eval "$(direnv hook zsh)"
