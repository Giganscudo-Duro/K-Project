


# Wake on Lan とは






# WoL の実行方法(Client)

## RedHat系Linux（Fedora,CentOS)
現状では、以下の2つのコマンドが提供されている。
パッと見た感じだと、`wol` コマンドの方が利用可能なオプションが豊富なため、色々と融通が利くのかもしれない。
利用する場合は、基本的にどちらも `ether-wake <MACaddress>` や `wol <MACaddress>` という具合にコマンドを叩く。



- `ether-wake` コマンド
    標準リポジトリ内の `net-tools` パッケージに含まれるコマンド。
    ```sh
    [minase@nebula ~]$ which ether-wake
    /usr/sbin/ether-wake
    [minase@nebula ~]$ rpm -qf /usr/sbin/ether-wake
    net-tools-2.0-0.64.20160912git.fc37.x86_64
    ``` 
    `man ether-wake` や `ether-wake -u` で利用可能なオプションを確認可能。
    利用可能なオプションは、以下。
    - `-b`
        マジックパケットをブロードキャストアドレスに送信する。
    - `-D`
        デバッグレベルを指定する。
    - `-i ifname`
        送信対象のネットワークデバイスを指定する。
    - `-p passwd`
        パスワードを指定する。
    - `-V`
        バージョンを表示する


- `wol` コマンド
    epel リポジトリ内の `wol` パッケージに含まれるコマンド。
    ```sh
    [minase@nebula ~]$ which wol
    /usr/bin/wol
    [minase@nebula ~]$ rpm -qf /usr/bin/wol
    wol-0.7.1-29.fc37.x86_64
    ``` 
    `man wol` や `wol --help` で利用可能なオプションを確認可能。
    利用可能なオプションは、以下。
    - `--help`
        ヘルプを表示する
    - `-V`, `--version`
           バージョンを表示する
    - `-h HOST`, `--host=HOST`, `-i HOST`, `--ipaddr=HOST`
        WoL対象のホストをホスト名 または IPアドレスで指定する
        `--ipaddr` も `--host` と同じ効果らしい。
    - `-b HOST`,  `--bind=HOST`
           Bind to this IP address or hostname. This allows broadcasting on multihomed hosts by specifying the IP address of the
           desired outgoing interface.
    - `-p NUM`, `--port=NUM`
        キャストするUDPポートを指定する。デフォルトは40000。
    - `-f FILE`, `--file=FILE`, `-`
           ハードウェアアドレスやIPアドレス(ホスト名)、ポート番号などの情報を指定したファイルから取得する。
           `-` を指定した場合は標準入力(他の操作からのパイプなど)から取得する。
    - `-v`, `--verbose`
        処理の詳細を表示する。
    - `-w NUM`, `--wait=NUM`
        マジックパケットを送信してから指定されたミリ秒待つ。
    - `--passwd[=PASS]`
        パスワードを指定する。
        パスワードは `ethtool` 等で設定できるとのこと。






















