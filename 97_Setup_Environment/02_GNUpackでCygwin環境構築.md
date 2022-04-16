# GNU pack の入手






# apt-cyg の調整


1. `pubring.asc` の取得  
    以下のコマンドを実行する。
    ```sh
    wget https://cygwin.com/key/pubring.asc
    ``` 
    ちなみにこのファイルのURLは `/app/script/apt-cyg` 内の `TRUSTEDKEY_CYGWIN_URL_LATEST` に記載されているもの。

2. `pubring.asc` のチェックサムを取得  
    以下のコマンドを実行する。  
    ```sh
    # sha512sum.exe pubring.asc
    019b3d2efe208f1441c660a34d08151b5c9675523b85e0a4ca748137ed45d086a4eb06e0efd4d86a1479246e62641a0c284ffb8c4b0b637063681a9282beca3d *pubring.asc
    ``` 


3. `/app/script/apt-cyg` を修正  
    以下のように修正する。  
    ```
    39 TRUSTEDKEYS=( CYGWIN );   ## CYGWINPORT の記述を消す。もう存在しておらず、記述があるとエラーを起こす。
    40 # ./pubring.asc
    41 # ------------
    42 # pub   1024D/676041BA 2008-06-13
    43 # uid                  Cygwin <cygwin@cygwin.com>
    44 # sub   1024g/A1DB7B5C 2008-06-13
    45 TRUSTEDKEY_CYGWIN_SUM="019b3d2efe208f1441c660a34d08151b5c9675523b85e0a4ca748137ed45d086a4eb06e0efd4d86a1479246e62641a0c284ffb8c4b0b637063681a9282beca3d"  ## 先ほど確認したチェックサムに置き換える。
    46 TRUSTEDKEY_CYGWIN_FPR="1169DF9F22734F743AA59232A9A262FF676041BA"
    47 TRUSTEDKEY_CYGWIN_URL_LATEST="https://cygwin.com/key/pubring.asc"
    48 # ./ports.gpg
    ```

4. リポジトリ情報を最新化  
    以下のコマンドを実行する。  
    ちなみに1回目は失敗するみたいなので、2回実行する。  
    ```sh
    apt-cyg update
    ```

5. パッケージ取得元の更新とアップデート  
    以下のコマンドを実行する。  
    インストーラチックなものが出るので、「アップデート時の参照先」、「追加するパッケージ」を指定し、処理を進めればOK  
    ```sh
    apt-cyg dist-upgrade
    ```












