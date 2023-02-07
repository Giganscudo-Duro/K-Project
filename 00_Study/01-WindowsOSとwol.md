


# Wake on Lan とは


# Windows 10 の WoL

## システムの電源状態



[Windows10の2つのWake on LAN方式と設定方法詳細]( https://n-archives.net/software/nwol/wol-pc-setting/shutdown-state-and-wol-settings.html )からのほぼ引用。
自分の理解のため、一部列の整形などを実施している。



- システムの電源状態 (System Power State)
    <table>
      <tr>
        <th>ACPI state</th>
        <th>PowerState</th>
        <th>説明</th>
      </tr>
      <tr>
        <td>S0</td>
        <td>Working</td>
        <td>
        起動状態
        </td>
      </tr>
      <tr>
        <td>S0 low-power idle</td>
        <td>Sleep (Modern Standby)</td>
        <td>
        Modern Standbyに対応したPCでは、Windows10のスリープはこの電源状態になる。
        Sleep状態だがバックグラウンドで必要な最低限のNW通信処理などが行われる。
        </td>
      </tr>
      <tr>
        <td>S1, S2, S3</td>
        <td>Sleep</td>
        <td>
        システムは停止状態になるが、メモリ上のデータはそのままメモリ上に維持され、リフレッシュされ続ける。(消費電力は S1>S2>S3)
        PCをWakeupさせるため、キーボードやLANデバイスなどのデバイスには最小限の通電が行われます。
        </td>
      </tr>
      <tr>
        <td>S4</td>
        <td>Hibernate</td>
        <td>
        メモリ上の実行イメージをディスクに保存し、システムは停止状態になる。消費電力はSleepより低減。
        PCをWakeupさせるため、キーボードやLANデバイスなどのデバイスには最小限の通電が行われます。
        </td>
      </tr>
      <tr>
        <td>S5</td>
        <td>Soft Off</td>
        <td>
        Windowsが完全に終了した状態。
        PCをWakeupさせるため、キーボードやLANデバイスなどのデバイスには最小限の通電が行われます。
        </td>
      </tr>
      <tr>
        <td>G3</td>
        <td>Mechanical Off</td>
        <td>
        物理的な電力断。
        </td>
      </tr>
    </table>




- Windows10の停止方法による電源状態
    <table>
      <tr>
        <th>停止方法</th>
        <th>遷移する電源状態</th>
        <th>状態説明</th>
      </tr>
      <tr>
        <td>スリープ(Modern Standby PC)</td>
        <td>S0 low-power idle</td>
        <td>
        Modern Standbyに対応したPCでは、Windows10でのスリープはこの電源状態になる。
        Sleep状態だがバックグラウンドで必要な最低限のNW通信処理などが行われる。
        </td>
      </tr>
      <tr>
        <td>スリープ(非Modern Standby PC)</td>
        <td>S3</td>
        <td>
        Modern Standbyに対応していない従来型のPCのスリープはこの電源状態になる。
        システムは停止状態になるが、メモリ上のデータはそのままメモリ上に維持され、リフレッシュされ続ける。
        LANデバイスなどには通電させるため、WOLは可能。
        </td>
      </tr>
      <tr>
        <td>休止状態</td>
        <td>S4(Hibernate)</td>
        <td>
        Modern Standbyに対応していない従来型のPCのスリープはこの電源状態になる。
        メモリ上の実行イメージをディスク(hibernation file)に保存し、起動時に高速に復帰できるようにする。
        LANデバイスなどには通電させるため、WOLは可能。
        </td>
      </tr>
      <tr>
        <td>シャットダウン（高速スタートアップ有効時）</td>
        <td>S4(Hybrid shutdown)</td>
        <td>
        Windowsのメモリ上の実行イメージをディスクに保存し、起動時に高速に復帰できるようにする。
        Hybrid shutdown(高速スタートアップ)は、Hibernateの一種ではあるが、Windows10のデフォルトのシャットダウンであるため、電力を極力抑えるため、WOLに対応していない。
        </td>
      </tr>
      <tr>
        <td>シャットダウン（高速スタートアップ無効時）</td>
        <td>S5</td>
        <td>
        Windowsが完全に終了した状態。(Windowsの管理外。)
        フルシャットダウン、または、クラシックシャットダウンと呼ばれる。
        </td>
      </tr>
    </table>






## スリープ・休止・電源オフをの設定手順と実行手順
- スリープ
    - 設定手順  
        [コントロールパネル > ハードウェアとサウンド > 電源オプション > 電源ボタンの動作を選択する] を選択する。  
        [電源ボタンを押したときの動作] の横のドロップダウンリストから [スリープ状態] を選択し、[変更の保存] をクリックする。  
    - 実施手順  
        電源ボタンを押す。
- 休止状態
    - 設定手順  
        [コントロールパネル > ハードウェアとサウンド > 電源オプション > 電源ボタンの動作を選択する] を選択する。
        [現在利用可能ではない設定を変更します] をクリックして設定変更可能にし、 [シャットダウン設定] の項にある[休止状態] のチェック ボックスをオンにし、[変更の保存] をクリックする。
    - 実施手順  
        [スタート] を 選択し 、[電源 > 休止状態] を選択する。
- 完全にオフ
    - 設定手順  
        特になし
    - 実施手順  
        [スタート] を 選択し 、[電源 > シャットダウン] を選択する。



## 利用可能なスリープ状態を確認する
PowerShell を起動して以下のコマンドを実行すると、利用可能なスリープ状態を確認する事ができる。
基本的にこちらで確認できたスリープ状態でなければ利用できないので注意。
```sh
powercfg /a
```
実際に実行した例が以下。
```sh
PS C:\Users\MINASE> powercfg /a
以下のスリープ状態がこのシステムで利用可能です:
    スタンバイ (S3)
    休止状態
    ハイブリッド スリープ
    高速スタートアップ

以下のスリープ状態はこのシステムでは利用できません:
    スタンバイ (S1)
        システム ファームウェアはこのスタンバイ状態をサポートしていません。

    スタンバイ (S2)
        システム ファームウェアはこのスタンバイ状態をサポートしていません。

    スタンバイ (S0 低電力アイドル)
        システム ファームウェアはこのスタンバイ状態をサポートしていません。
```


# Wol の設定方法(サーバー側)






# WoL の実行方法(クライアント側)

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
           Bind to this IP address or hostname.  
           This allows broadcasting on multihomed hosts by specifying the IP address of the desired outgoing interface.
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







# 参考URL

- [PC をシャットダウン、スリープ、休止状態にする]( https://support.microsoft.com/ja-jp/windows/pc-%E3%82%92%E3%82%B7%E3%83%A3%E3%83%83%E3%83%88%E3%83%80%E3%82%A6%E3%83%B3-%E3%82%B9%E3%83%AA%E3%83%BC%E3%83%97-%E4%BC%91%E6%AD%A2%E7%8A%B6%E6%85%8B%E3%81%AB%E3%81%99%E3%82%8B-2941d165-7d0a-a5e8-c5ad-8c972e8e6eff )














