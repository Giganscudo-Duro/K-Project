# 実行環境


```sh
# VMware 環境上に作成した Ubuntu 2204 LTS で実行

kanamaru@kanamaru-virtual-machine:~$ uname -a
Linux kanamaru-virtual-machine 5.15.0-58-generic #64-Ubuntu SMP Thu Jan 5 11:43:13 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux

kanamaru@kanamaru-virtual-machine:~$ cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.1 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.1 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
``` 

# 導入手順


## TypeScript を導入
以下、導入手順
```sh
# nodejs と npm を、ubuntu リポジトリから取得
sudo apt install nodejs npm

# インストール後に、バージョンを確認
node -v
npm -v

# TypeScript コンパイラをインストールして利用可能にしておく。
sudo npm install -g typescript

# 導入した TypeScript コンパイラのバージョンチェック
tsc -v
``` 



## Nuxt を導入

- npm
    Node.jsで外部パッケージをインストールして使うためのマネージャ。
    package.jsonを読み込んで、npmのレポジトリに取りに行く。
    ローカルインストールした場合、必ず./node_modules/.bin/配下にコマンドがインストールされる。
    ちなみにGlobalにインストールした場合、Linuxだと/usr/local/bin/配下になる。
    CLIツールを落としてきたときに、使うためにはpackage.jsonのscriptsに定義を書かないといけない。
    これが面倒くさい。


- npx
    npmのバージョン5.2.0以降はnpxがプリインストールされているそう。
    手で入れる場合はnpm install -g npxを実行する。
    npxでコマンドを実行したいときは、package.jsonに書かないでも、npx コマンド名打つだけで実行してくれる。
    このとき、npxは勝手にインストールされてるパスを調べて「コマンド名」が存在するかチェックして実行してくれる。
- n
    n は Node.js のバージョンを管理するツール｡ nodist の Linux版みたいな感じ。
    これを入れることでバージョン単位で Node.js を導入することができ､状況に応じてバージョンを切り替えることができる｡
- yarn
    Yarnは、『Yet AnotherResourceNegotiator』の略です。
    2016年10月にFacebookによってリリースされたnpmの代替手段です。　
    yarnはnpmを経由して、グローバルでインストールしなくてはなりません。



以下、導入手順
```sh
# nodejs と npm を、ubuntu リポジトリから取得
sudo apt install nodejs npm

# インストール後に、バージョンを確認
node -v
npm -v

# n をインストールして、バージョンを確認
sudo npm install -g n
n -v

# yarn をインストールして、バージョンを確認
sudo npm install -g yarn
yarn -v

# 基本的に Ubuntu のリポジトリから取得した npm はバージョンが古いので、別途 npx をインストールして利用可能にしておく。
sudo npm install -g npx
npx -v

# Node.js のバージョンにマッチした npm に揃える
# Node.jsとnpmのバージョンにずれが発生していると、npmでパッケージをインストールしようとした際に cb.apply is not a functionというエラーが出るため
sudo n stable
``` 

# Nuxt のプロジェクトを作ってみる


```sh
# 後述のプロジェクト作成で、バージョンが古いと怒られたので、指定されたバージョンにアップデート
sudo npm install -g npm@9.3.1



# 作業用ディレクトリの作成＆移動
mkdir 00-Nuxt
cd 00-Nuxt/


npx create-nuxt-app KANA-SAMPLE
``` 

以下、実際に実行した例
```sh
kanamaru@kanamaru-virtual-machine:~/00-Nuxt$ npx create-nuxt-app KANA-SAMPLE

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
``` 

実際に作られたプロジェクトを動かして、確認してみる
```sh
# 
sudo npm install -g semver
semver -h

``` 






















# 参考URL
- [npmとnpx。なにが違う？ - Qiita]( https://qiita.com/sivertigo/items/622550c5d8ec991e59a6 )
- [npxを使おうとしてハマった件について - エンターテインメント！！]( https://suzaku-tec.hatenadiary.jp/entry/2020/08/10/153653 )
- [[Node.js] Node.js の導入(Linux, Mac編) - Qiita]( https://qiita.com/ksh-fthr/items/c272384f73f8e319733c )
- [【Nuxt.js】create-nuxt-appのすすめ 〜create-nuxt-appの質問に負けたくないあなたへ〜 - Qiita]( https://qiita.com/cheez921/items/fdfd224099f686e3173d )
- [npmとyarnの基本的な使い方【パッケージ管理】 - deve.K]( https://dev-k.hatenablog.com/entry/npm-yarn-hatenablog )

