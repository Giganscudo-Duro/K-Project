# 最新の node.js、npm を導入
以下のコマンドを実行。
```sh
sudo apt install nodejs npm
sudo npm aache clean
sudo npm install -g n
sudo n stable
sudo npm update -g npm
```
ここら辺は、色々とバージョンの兼ね合いとかがあるので、注意が必要。



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

