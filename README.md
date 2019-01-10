# dotfile置き場
開発環境再構築用に、書けるものはここにまとめておく。

# 復旧手順
## install Xcode commandline tools.
```
xcode-select --install
```

## Git clone
Clone into ~/dotfiles
```
git clone https://github.com/assaulter/dotfiles.git ~/dotfiles
```

## install
```
# install brew command if it isn't installed.
bash ~/dotfiles/setup.sh initialize
```

## deploy
```
# Do not override existing dotfiles
bash ~/dotfiles/setup.sh deploy

# Force override existing dotfiles
bash ~/dotfiles/setup.sh -f deploy
```
