# dotfile置き場
開発環境再構築用に、書けるものはここにまとめておく。

# 復旧手順

### このディレクトリをgithubからzipでDL

### Homebrewをインストールする
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

※コマンドは変更される可能性があるので、公式を見に行くこと

### Brewfile
homebrewに対するbundler的な。

Brewfileがあるディレクトリで下記コマンドを実行

```
$ brew bundle
```

