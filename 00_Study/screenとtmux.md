# screen, tmux とは


# screen や tmux を用いたセッションの保存と復帰
screen や tmux にはセッションのデタッチ・アタッチという機能があります。
この機能を用いることで、SSH接続時に作業内容を一時保存、再接続時に作業内容を復帰といった操作が可能になります。

注意：
screenやtmuxを用いた作業内容の一時保存と復帰は、対象のサーバーのシャットダウン・リブートには対応していません。



ポイント：
screen や tmux はセッションのデタッチ・アタッチ以外にも、複数ウィンドウ管理や画面分割といった多くの便利な機能が用意されていますが、本項ではそれらを取り扱いません。


## 事前準備

- 接続先サーバーに screen もしくは tmux をインストール
    - screen のインストールコマンド
        RHEL、CentOSの場合）`yum install screen`
        ubuntu の場合）`apt install screen`
    - tmux のインストールコマンド
        RHEL、CentOSの場合）`yum install tmux`
        ubuntu の場合）`apt install tmux`


## 利用例１：screenを用いたセッションの保存と復帰



## 利用例２：tmuxを用いたセッションの保存と復帰
1. tmux を起動
    以下のコマンドを実行します。
    `tmux`

2. tmux を起動した状態で、各種作業を実施

3. 作業を中断するため、セッションをデタッチ
    以下のコマンドを実行します。
    `PREFIX d`

4. サーバーとのSSH接続を終了

5. 先程のサーバーに再度、SSH接続

6. 保存されているセッションの一覧を確認
    以下のコマンドを実行
    `tmux ls`

7. 一覧に表示されたセッションにアタッチ
    `tmux a`

8. 作業が終了し、tmuxを終了する
    通常のターミナルと同様に、以下のコマンドを実行します。
    `exit`


https://www.sbcloud.co.jp/entry/column/security_part9?utm_source=feed
https://www.sbcloud.co.jp/entry/sol/desktop/
