# fedora の場合


## よく使うパッケージをインストール
```sh
sudo yum install -y \
  bash-completion \
  vim \
  gvim \
  screen \
  gnome-tweak-tool
```

## 仮想系のパッケージをインストール
```sh
sudo yum install -y \
  libvirt \
  virt-manager
```


## ssh 接続に必要な設定を実施
```sh
sudo firewall-cmd --add-port=22/tcp --permanent
sudo firewall-cmd --reload
sudo systemctl enable sshd
sudo systemctl start sshd
```



# ubuntu の場合


## よく使うパッケージをインストール
```sh
sudo apt install -y \
  vim \
  gvim \
  screen
```

## ssh 接続に必要な設定を実施
```sh
sudo apt install -y openssh-server
sudo systemctl start ssh
sudo systemctl enable ssh
```


## docker のインストール
参考：https://qiita.com/iganari/items/fe4889943f22fd63692a

1. とりあえずパッケージリストのアップデート  
    ```sh
    sudo apt update
    ```

2. HTTPS経由でrepositoryをやりとり出来るようにするためのパッケージをインストール  
    ```sh
    sudo apt install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      software-properties-common
    ```


3. Dockerの公式GPG keyを追加する  
    ```sh
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    ```

4. repository( stable ) を追加する  
    ```sh
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) \
      stable"
    ```

5. docker をインストール  
    ```sh
    sudo apt install -y docker-ce
    ```

