# 参考URL

- [Xmingで日本語入力]( https://kan.typepad.jp/kanblo/2008/12/xming-640b.html )
- [Windows用Xサーバ での日本語入力設定 ]( https://pcvogel.sarakura.net/2016/07/10/31610 )
- [【Xming】インストールと使い方 ]( https://www.teamxeppet.com/xming1/ )
- [Xming + Teraterm で画面転送]( http://www.mikitechnica.com/11-xming-teraterm.html )




# 事前準備
必要になるソフトの入手＆インストール

- [Tera Term (テラターム) プロジェクト日本語トップページ]( https://ja.osdn.net/projects/ttssh2/ )
- [Xming X Server for Windows 日本語情報トップページ - OSDN]( https://ja.osdn.net/projects/sfnet_xming/ )

# 導入手順


## Xming 側の導入＆初期設定
1. Xming をインストール
2. `Xlaunch.exe` を起動
3. 初期設定を実施
    1. `Multiple windows` を選択し、[次へ] ボタンをクリック
    2. `Start no client` を選択し、[次へ] ボタンをクリック
    3. `Clipboard`、`No Access Control` にチェックを入れてを、[次へ] ボタンをクリック
    4. `Save configuration` をクリックした後、 [完了] ボタンをクリック
4. `Xming.exe` をクリックして、起動


## TeraTerm 側の導入＆初期設定
1. TeraTerm をインストール
2. `ttermpro.exe` を起動
3. Xサーバ転送を設定
    1. メニューバーから [設定] - [SSH転送] と移動する
    2. `リモートのXアプリケーションをローカルのXサーバに表示する` にチェックを入れて、[OK] ボタンをクリック




# 利用手順
今回は、以下の環境を前提として、利用手順を記録する
| 分類            | IPアドレス        |
|-----------------|-------------------|
| 接続元(Windows) | `192.168.180.128` |
| 接続先(Linux)   | `192.168.180.130` |

1. 接続元で TeraTerm を起動し、SSH転送で Xサーバ転送 が有効になっていることを確認
2. 接続元から、接続先(`192.168.180.130`) にSSH接続
3. 接続先で、以下のコマンドを実行  
    ```sh
    # export DISPLAY=<接続元のIPアドレス>:<Display number>.<Screen number>
    export DISPLAY=192.168.180.128:0.0
    ```
4. gVim なりなんなりのGUIアプリケーションを起動




