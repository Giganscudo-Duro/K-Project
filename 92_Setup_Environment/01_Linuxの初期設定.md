# fedora の場合


## よく使うパッケージをインストール
```sh
yum install -y \
  bash-completion \
  vim \
  gvim \
  screen \
  gnome-tweak-tool
```

## 仮想系のパッケージをインストール
```sh
yum install -y libvirt
yum install -y virt-manager
```


## ssh 接続に必要な設定を実施
```
firewall-cmd --add-port=22/tcp --permanent
firewall-cmd --reload
systemctl enable sshd
systemctl start sshd
```



# ubuntu の場合


## よく使うパッケージをインストール
```sh
apt install -y vim
apt install -y gvim
apt install -y screen
```

## ssh 接続に必要な設定を実施
```
apt install -y ssh
systemctl start ssh
```


## docker のインストール
参考：https://qiita.com/iganari/items/fe4889943f22fd63692a

1. とりあえずパッケージリストのアップデート  
    ```
    apt update
    ```

2. HTTPS経由でrepositoryをやりとり出来るようにするためのパッケージをインストール  
    ```
    apt install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      software-properties-common
    ```


3. Dockerの公式GPG keyを追加する  
    ```
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    ```

4. repository( stable ) を追加する  
    ```
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) \
      stable"
    ```

5. docker をインストール  
    ```
    apt install -y docker-ce
    ```

