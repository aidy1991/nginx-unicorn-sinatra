# 開発環境構築

## vim
ローカルから
```
$ scp -i key.pub -r ~/.vim server:
$ scp -i key.pub ~/.vimrc server:
```

### .vimrc の修正
neocompleteを削除

## git
まずは入っているかの確認
```
$ sudo yum install git
```

## zsh
```
$ sudo yum install zsh
```

### zshの設定
ローカルから
```
$ scp -i key.pub -r ~/.oh-my-zsh server:
$ scp -i key.pub ~/.zshrc server:
```

### .zshrc の修正
alias vim の修正

### zsh をデフォルトに
.bashrc に以下を追記
```
$ exec zsh
```

### rbenv が正しく動くように
zshに変えた後に
```
$ rbenv rehash
```

# ruby 環境構築
## rbenv で ruby をインストール
ruby がインストールされていないか確認
http://kzy52.com/entry/2015/05/13/201831

## bundler をインストール
```
$ gem install bundler
```

## mysql-devel をインストール
```
$ sudo yum mysql-devel
```

## 各種 gem を bundler でインストール
http://qiita.com/hiroki_y/items/06f5780543bec988d8b7

```
[Gemfile]
gem ‘sinatra'
gem ‘mysql2'
gem ‘unicorn'
```

## sinatra が動くか確認
http://www.sinatrarb.com/intro-ja.html
sinatra は dev環境では localhost しか見ない & ec2 のポートが開いているか確認
http://d.hatena.ne.jp/keitanxkeitan/20140122/1390407289

## unicorn を通してsinatra を起動
http://qiita.com/konpyu/items/3ba3774bcde226d7d07d
unicorn.rb や tmp/pids/ ディレクトリ，log/ ディレクトリを作る

［メモ］unicorn の停止
```
$ kill -QUIT  `cat /path/to/unicorn.pid`
```

［メモ］unicorn の再起動がめんどくさい
http://qiita.com/akito1986/items/56198edcafc222b320a8

# サーバ構築
## nginx をインストール
```
$ sudo yum install nginx
```
確認
```
$ which nginx
```

## nginx と unicorn の連携
http://qiita.com/konpyu/items/3ba3774bcde226d7d07d

［メモ］設定ファイルのテスト
```
$ nginx -t -c /etc/nginx/nginx.conf
```
