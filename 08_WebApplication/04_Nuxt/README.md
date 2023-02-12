# 環境構築

## node.js、npm を導入  
以下のコマンドを実行。  
ここら辺は、色々とバージョンの兼ね合いとかがあるので、注意が必要。  

- Ubuntu  
    ```sh
    sudo apt install nodejs npm
    npm aache clean
    npm update -g npm
    npm install -g n
    npm install yarn -g
    n stable
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
    

    sudo npm update -g npm
    sudo npm install -g n
    sudo npm install yarn -g

    # 後述するが、NUXT実行時の ` Error: error:0308010C:digital envelope routines::unsupported` を避けるため
    # node のバージョンを 16.15.1 にダウングレードしてあげる
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



## Nuxt のプロジェクト作成
以下のコマンドを実行して、プロジェクトを作成する。  
```sh
npx create-nuxt-app <任意のプロジェクト名>
```

実際に実行した結果は以下。
```sh
npx create-nuxt-app NUXT-SAMPLE
--[実行結果]-----
create-nuxt-app v5.0.0
✨  Generating Nuxt.js project in NUXT-SAMPLE
? Project name: NUXT-SAMPLE
? Programming language: TypeScript
? Package manager: Yarn
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

🎉  Successfully created project NUXT-SAMPLE

  To get started:

        cd NUXT-SAMPLE
        yarn dev

  To build & start for production:

        cd NUXT-SAMPLE
        yarn build
        yarn start


  For TypeScript users.

  See : https://typescript.nuxtjs.org/cookbook/components/
``` 





## NUXT の設定を変更する

デフォルトだと、localhost:3000 でしかアクセスできない。
なので、`<プライベートIP>:<ポート番号>`でアクセスできるように設定を変更する。

- `~/<NUXT-SAMPLE>/package.json`
    ```
      ...(snip)...
       "devDependencies": {
         "@nuxt/types": "^2.15.8",
         "@nuxt/typescript-build": "^2.1.0"
    +  },
    +  "config": {
    +    "nuxt": {
    +      "host": "0.0.0.0",
    +      "port": "3000"
    +    }
       }
     }
    ```

## NUXT を起動する
実行結果中の指示に従って、起動する。
```sh
cd NUXT-SAMPLE
yarn dev
``` 

あとは手元でブラウザを立ち上げて、プライベートIP:3000へとアクセスすればOK









# トラブル

## トラブル１
- [「 Error: error:0308010C:digital envelope routines::unsupported 」 の対処法]( https://zenn.dev/pontagon333/articles/26c89cbc14e81f )  
    NUXTを起動した際に以下のエラー
    ```sh
    node:internal/crypto/hash:71
      this[kHandle] = new _Hash(algorithm, xofLen);
                      ^
    
    Error: error:0308010C:digital envelope routines::unsupported
        at new Hash (node:internal/crypto/hash:71:19)
        at Object.createHash (node:crypto:130:10)
        at module.exports (/home/kanamaru/NUXT-SAMPLE/node_modules/webpack/lib/util/createHash.js:135:53)
        at NormalModule._initBuildHash (/home/kanamaru/NUXT-SAMPLE/node_modules/webpack/lib/NormalModule.js:417:16)
        at handleParseError (/home/kanamaru/NUXT-SAMPLE/node_modules/webpack/lib/NormalModule.js:471:10)
        at /home/kanamaru/NUXT-SAMPLE/node_modules/webpack/lib/NormalModule.js:503:5
        at /home/kanamaru/NUXT-SAMPLE/node_modules/webpack/lib/NormalModule.js:358:12
        at /home/kanamaru/NUXT-SAMPLE/node_modules/webpack/node_modules/loader-runner/lib/LoaderRunner.js:373:3
        at iterateNormalLoaders (/home/kanamaru/NUXT-SAMPLE/node_modules/webpack/node_modules/loader-runner/lib/LoaderRunner.js:214:10)
        at Array.<anonymous> (/home/kanamaru/NUXT-SAMPLE/node_modules/webpack/node_modules/loader-runner/lib/LoaderRunner.js:205:4)
        at Storage.finished (/home/kanamaru/NUXT-SAMPLE/node_modules/enhanced-resolve/lib/CachedInputFileSystem.js:55:16)
        at /home/kanamaru/NUXT-SAMPLE/node_modules/enhanced-resolve/lib/CachedInputFileSystem.js:91:9
        at /home/kanamaru/NUXT-SAMPLE/node_modules/graceful-fs/graceful-fs.js:123:16
        at FSReqCallback.readFileAfterClose [as oncomplete] (node:internal/fs/read_file_context:68:3) {
      opensslErrorStack: [ 'error:03000086:digital envelope routines::initialization error' ],
      library: 'digital envelope routines',
      reason: 'unsupported',
      code: 'ERR_OSSL_EVP_UNSUPPORTED'
    }
    error Command failed with exit code 1.
    info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
    [kanamaru@fedora NUXT-SAMPLE]$ node:internal/process/promises:279
                triggerUncaughtException(err, true /* fromPromise */);
                ^
    
    RpcIpcMessagePortClosedError: Cannot send the message - the message port has been closed for the process 3318.
        at /home/kanamaru/NUXT-SAMPLE/node_modules/fork-ts-checker-webpack-plugin/lib/rpc/rpc-ipc/RpcIpcMessagePort.js:47:47
        at processTicksAndRejections (node:internal/process/task_queues:82:21) {
      code: undefined,
      signal: undefined
    }
    node:internal/process/promises:279
                triggerUncaughtException(err, true /* fromPromise */);
                ^
    
    RpcIpcMessagePortClosedError: Cannot send the message - the message port has been closed for the process 3319.
        at /home/kanamaru/NUXT-SAMPLE/node_modules/fork-ts-checker-webpack-plugin/lib/rpc/rpc-ipc/RpcIpcMessagePort.js:47:47
        at processTicksAndRejections (node:internal/process/task_queues:82:21) {
      code: undefined,
      signal: undefined
    }
    
    ```













# 参考 URL

- [Nuxt.js使ってみた - Qiita]( https//qiita.com/_takeshi_24/items/224d00e5a026dbb76716 )
- [Nuxt.jsを使ってTodoリストを作ってみる - BOEL]( https//www.boel.co.jp/tips/vol107_todoLists-with-Nuxt-js.html )
- [Fedora 29 に Node.js 12 系の最新版を dnf インストールする]( https://サーバー構築と設定.com/?p=3354 )
- [Rspberry Pi 4のFedora 37に任意のバージョンのnodejsをインストールするには ]( https://denor.jp/rspberry-pi-4%E3%81%AEfedora-37%E3%81%AB%E4%BB%BB%E6%84%8F%E3%81%AE%E3%83%90%E3%83%BC%E3%82%B8%E3%83%A7%E3%83%B3%E3%81%AEnodejs%E3%82%92%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%99 )
- [初期設定 : モジュラーリポジトリを利用する]( https://www.server-world.info/query?os=Fedora_35&p=initial_conf&f=6 )


https://developer.fedoraproject.org/tech/languages/nodejs/nodejs.html

https://tecadmin.net/install-yarn-centos/
https://developer.fedoraproject.org/tech/languages/nodejs/nodejs.html
https://learning.mihune-web.com/nodejs_install/



- [Nuxt.js の起動時に外部アクセス可能なIPを指定する]( https://blog.mintsu-dev.com/posts/2020-08-04-virtualbox-nuxt/ )




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

