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
    sudo dnf module install nodejs:16
    
    # Node.js 16 が[e]nabled, [i]nstalled 状態になったことを確認
    dnf module list nodejs
    
    # Node.js のバージョンを確認
    node -v
    
    # 他バージョンの Node.js に切り替えたい場合は一旦リセットする
    sudo dnf module reset nodejs
    
    # 今度は Node.js 12 を有効にしてインストール
    # 利用可能プロファイルは common, development, minimal で、dnf mofule list nodejs 実行時に確認できる
    sudo dnf module enable nodejs:14
    sudo dnf module install nodejs:14/common

    
    # Node.js 14 が [e]nabled 状態になった事を確認
    dnf module list nodejs 
    
    # Node.js のバージョンを確認
    node -v
    ``` 
後述の作成したプロジェクトの実行時に ` Error: error:0308010C:digital envelope routines::unsupported` が起きてしまう。
コレは、node のバージョンが新しすぎることが原因のようなので、あえて14に下げた。


# 手順１：まずは Nuxt のプロジェクトを作る
以下のコマンドを実行して、プロジェクトを作成する。  
```sh
$ npx create-nuxt-app KANA-SAMPLE
```

設定内容は以下の通り。


```sh
[kanamaru@fedora ~]$ npx create-nuxt-app KANA-SAMPLE
Need to install the following packages:
  create-nuxt-app@5.0.0
Ok to proceed? (y) y
npm WARN deprecated source-map-url@0.4.1: See https://github.com/lydell/source-map-url#deprecated
npm WARN deprecated source-map-resolve@0.5.3: See https://github.com/lydell/source-map-resolve#deprecated
npm WARN deprecated urix@0.1.0: Please see https://github.com/lydell/urix#deprecated
npm WARN deprecated resolve-url@0.2.1: https://github.com/lydell/resolve-url#deprecated

create-nuxt-app v5.0.0
?  Generating Nuxt.js project in KANA-SAMPLE
? Project name: KANA-SAMPLE
? Programming language: TypeScript
? Package manager: Npm
? UI framework: None
? Template engine: HTML
? Nuxt.js modules: (Press <space> to select, <a> to toggle all, <i> to invert selection)
? Linting tools: (Press <space> to select, <a> to toggle all, <i> to invert selection)
? Testing framework: None
? Rendering mode: Single Page App
? Deployment target: Server (Node.js hosting)
? Development tools: (Press <space> to select, <a> to toggle all, <i> to invert selection)
? What is your GitHub username?
? Version control system: None
Warning: name can no longer contain capital letters

??  Successfully created project KANA-SAMPLE

  To get started:

        cd KANA-SAMPLE
        npm run dev

  To build & start for production:

        cd KANA-SAMPLE
        npm run build
        npm run start


  For TypeScript users.

  See : https://typescript.nuxtjs.org/cookbook/components/
npm notice
npm notice New major version of npm available! 8.19.2 -> 9.3.1
npm notice Changelog: https://github.com/npm/cli/releases/tag/v9.3.1
npm notice Run npm install -g npm@9.3.1 to update!
npm notice
``` 


いつもの手順で動作してるかどうかを確認する。
```sh
cd KANA-SAMPLE
npm run dev
``` 








```sh
$ ssh -X <UserName>@<IP-Address>
$ firefox localhost:3000
```






























# トラブル

## トラブル１
- [「 Error: error:0308010C:digital envelope routines::unsupported 」 の対処法]( https://zenn.dev/pontagon333/articles/26c89cbc14e81f )


