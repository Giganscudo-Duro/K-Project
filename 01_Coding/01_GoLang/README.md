# README
プログラミング自体久しぶりなので、基本的な所からやり直し中。

参考図書は「基礎からわかるGo言語」


# Linux への Golang インストール

## 手順
1. バイナリダウンロード＆インストール
    ```sh
    # wget をインストール
    $ sudo yum -y install wget

    # カレントディレクトリを移動
    $ cd /usr/local

    # ダウンロード
    $ sudo wget https://go.dev/dl/go1.18.3.linux-amd64.tar.gz

    # 解凍 (/usr/local/go ができる)
    # $ tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
    $ sudo tar -C /usr/local -xzf go1.18.3.linux-amd64.tar.gz

    # 圧縮ファイルを削除
    $ sudo rm -rf go1.18.3.linux-amd64.tar.gz
    ``` 

2. GOPATH の設定
    ```sh
    # go コマンドのパスを通す。これで go コマンドが使えるようになる
    $ export PATH=$PATH:/usr/local/go/bin

    # GOPATH の設定
    # ↓基本的な設定 (https://github.com/golang/go/wiki/SettingGOPATH)
    $ export GOPATH=$HOME/.go
    $ export PATH=$PATH:$GOPATH/bin
    ``` 

3. `.bashrc` の変更
    ```sh
    # ホームディレクトリに戻る
    $ cd

    # .bashrc を編集
    $ vi .bashrc

    # 下記を最終行くらいに追加 (どこでもいい)
    export PATH=$PATH:/usr/local/go/bin
    export GOPATH=$HOME/.go
    export PATH=$PATH:$GOPATH/bin
    ```

4. 動作確認
    ```sh
    $ go version
    go version go1.18.3 linux/amd64
    ```

- 参考
  - [Linux に Golang (Go言語) をインストールする](http://psychedelicnekopunch.com/archives/664)
  - [Golang ダウンロードページ - 公式](https://go.dev/dl/)
  - [SettingGOPATH - git 公式](https://github.com/golang/go/wiki/SettingGOPATH)




