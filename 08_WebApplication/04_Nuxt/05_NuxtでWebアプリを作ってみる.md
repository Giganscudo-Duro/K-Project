# Nuxt で「動くwebアプリ」を作ってみる

# 参考 URL

- [Nuxt.js使ってみた - Qiita]( https//qiita.com/_takeshi_24/items/224d00e5a026dbb76716 )
- [Nuxt.jsを使ってTodoリストを作ってみる - BOEL]( https//www.boel.co.jp/tips/vol107_todoLists-with-Nuxt-js.html )
- [Fedora 29 に Node.js 12 系の最新版を dnf インストールする]( https://サーバー構築と設定.com/?p=3354 )
- [Rspberry Pi 4のFedora 37に任意のバージョンのnodejsをインストールするには ]( https://denor.jp/rspberry-pi-4%E3%81%AEfedora-37%E3%81%AB%E4%BB%BB%E6%84%8F%E3%81%AE%E3%83%90%E3%83%BC%E3%82%B8%E3%83%A7%E3%83%B3%E3%81%AEnodejs%E3%82%92%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%99 )
- [初期設定 : モジュラーリポジトリを利用する]( https://www.server-world.info/query?os=Fedora_35&p=initial_conf&f=6 )

# 環境準備
とりあえず以下のコマンドを実行して、動作環境を整える
- Ubuntu
    ```sh
    sudo apt install nodejs npm
    npm aache clean
    npm install -g n
    n stable
    npm update -g npm
    ```
- Fedora
    ```sh
    # 利用可能なモジュールのリストを確認
    dnf module list
    
    # Node.js のモジュールリストに絞って確認
    dnf module list nodejs
    
    # Node.js 16 をインストールする場合
    dnf module install nodejs:16
    
    # Node.js 16 が[e]nabled, [i]nstalled 状態になったことを確認
    dnf module list nodejs
    
    # Node.js のバージョンを確認
    node -v
    
    # 他バージョンの Node.js に切り替えたい場合は一旦リセットする
    dnf module reset nodejs
    
    # 今度は Node.js 12 を有効にしてインストール
    dnf module enable nodejs:12
    dnf module install nodejs:12/default
    
    # Node.js 12 が [e]nabled 状態になった事を確認
    dnf module list nodejs 
    
    # Node.js のバージョンを確認
    node -v
    ``` 



# 手順１：まずは Nuxt のプロジェクトを作る
以下のコマンドを実行して、プロジェクトを作成する。  
```sh
$ npx create-nuxt-app KANA-SAMPLE
```

設定内容は以下の通り。


| 項目名               | 設定内容 | 備考 |
|----------------------|----------------------------------------------------|--|
| Project name         | KANA-SAMPLE                                        |  |
| Programming language | TypeScript                                         |  |
| Package manager      | Npm                                                |  |
| UI framework         | None                                               |  |
| Nuxt.js modules      | Axios, Progressive Web App (PWA), Content          |  |
| Linting tools        | ESLint, Prettier, Lint staged files, StyleLint     |  |
| Testing framework    | None                                               |  |
| Rendering mode       | Universal (SSR / SSG)                              |  |
| Deployment target    | Server (Node.js hosting)                           |  |
| Development tools    |                                                    |  |


いつもの手順で動作してるかどうかを確認する。
```sh
$ ssh -X <UserName>@<IP-Address>
$ firefox localhost:3000
```
































