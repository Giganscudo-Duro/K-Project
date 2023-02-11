# 環境構築

## node.js、npm を導入  
以下のコマンドを実行。  
ここら辺は、色々とバージョンの兼ね合いとかがあるので、注意が必要。  

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
    
    後述の作成したプロジェクトの実行時に ` Error: error:0308010C:digital envelope routines::unsupported` が起きてしまう。
    なので、node のバージョンを 16.15.1 にダウングレードしてあげる
    ```sh
    sudo n stable
    sudo n 16.15.1
    sudo n
    ``` 



- Fedora(おまけ)
    ```sh
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









# トラブル

## トラブル１
- [「 Error: error:0308010C:digital envelope routines::unsupported 」 の対処法]( https://zenn.dev/pontagon333/articles/26c89cbc14e81f )






# 手順１：まずは Nuxt のプロジェクトを作る
以下のコマンドを実行して、プロジェクトを作成する。  
```sh
npx create-nuxt-app NUXT-SAMPLE
```

設定内容は以下の通り。
```sh
[kanamaru@fedora ~]$ npx create-nuxt-app NUXT-SAMPLE

create-nuxt-app v5.0.0
?  Generating Nuxt.js project in NUXT-SAMPLE
? Project name: NUXT-SAMPLE
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

??  Successfully created project NUXT-SAMPLE

  To get started:

        cd NUXT-SAMPLE
        npm run dev

  To build & start for production:

        cd NUXT-SAMPLE
        npm run build
        npm run start


  For TypeScript users.

  See : https://typescript.nuxtjs.org/cookbook/components/
``` 


いつもの手順で動作してるかどうかを確認する。
```sh
cd NUXT-SAMPLE
npm run dev
``` 








```sh
$ ssh -X <UserName>@<IP-Address>
$ firefox localhost:3000
```












# 参考 URL

- [Nuxt.js使ってみた - Qiita]( https//qiita.com/_takeshi_24/items/224d00e5a026dbb76716 )
- [Nuxt.jsを使ってTodoリストを作ってみる - BOEL]( https//www.boel.co.jp/tips/vol107_todoLists-with-Nuxt-js.html )
- [Fedora 29 に Node.js 12 系の最新版を dnf インストールする]( https://サーバー構築と設定.com/?p=3354 )
- [Rspberry Pi 4のFedora 37に任意のバージョンのnodejsをインストールするには ]( https://denor.jp/rspberry-pi-4%E3%81%AEfedora-37%E3%81%AB%E4%BB%BB%E6%84%8F%E3%81%AE%E3%83%90%E3%83%BC%E3%82%B8%E3%83%A7%E3%83%B3%E3%81%AEnodejs%E3%82%92%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%99 )
- [初期設定 : モジュラーリポジトリを利用する]( https://www.server-world.info/query?os=Fedora_35&p=initial_conf&f=6 )


https://developer.fedoraproject.org/tech/languages/nodejs/nodejs.html






# Vim に vue 拡張子のシンタックスハイライトを導入する
以下のいずれかを実行。

- Vundle を利用
    ```sh
    Plugin 'posva/vim-vue'
    ```

- Pathogen を利用
    ```sh
    cd ~/.vim/bundle && \
    git clone https://github.com/posva/vim-vue.git
    ```

- プラグインマネージャを使わない  
    `git` で直接導入しちゃう
    ```sh
    git clone https://github.com/posva/vim-vue.git ~/.vim/pack/plugins/start/vim-vue
    ```

## 参考
- [ posva / vim-vue - Git](https://github.com/posva/vim-vue)
- [.vueファイルを編集するときのVimの設定 - Qiita](https://qiita.com/nabewata07/items/d92655485622aeb847a8)

