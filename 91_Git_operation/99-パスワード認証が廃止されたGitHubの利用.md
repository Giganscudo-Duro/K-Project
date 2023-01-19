# 概要
GitHub では、2021年8月13日にパスワード認証が廃止された。
https://github.blog/2020-12-15-token-authentication-requirements-for-git-operations/

そのため、認証が必要な操作を実行すると、以下のエラーメッセージが表示される。

```sh
[giganscudo-duro@fedora 01_GoLang]$  git push --set-upstream origin go-sse
Username for 'https://github.com': Giganscudo-Duro
Password for 'https://Giganscudo-Duro@github.com':
remote: Support for password authentication was removed on August 13, 2021.
remote: Please see https://docs.github.com/en/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
fatal: Authentication failed for 'https://github.com/Giganscudo-Duro/K-Project.git/'
``` 

このメモでは、上記に対する対処を記録する
- 個人アクセストークンの利用
- SSHの設定

# 個人アクセストークンの取得方法
常に利用するわけではなく、利用間隔がまちまちなため、利用期間を設定できるアクセストークンの方が、私には良いかも。
※セキュリティ上の理由から、GitHubは過去 1 年間使用されていない個人アクセストークンを自動的に削除するらしいので注意。

## 取得手順

1. 設定画面( https://github.com/settings/tokens )にアクセスし、トークン管理画面を表示させる
2. [Generate new token]をクリックし、入力画面を表示させる
3. 以下の操作を実施
    - noteにトークンのわかりやすい名前を記入
    - 権限を設定
        ※GitHub Actionを更新する場合は権限設定で[workflows]の選択が必要です。
        ※トークンを使用してコマンドラインからリポジトリにアクセスするには、権限設定で[repo] を選択します。
    - [Generate token] をクリック
4. 表示されたトークンをコピー
    ※ページを離れると参照不可になるのでメモを忘れずに



## 利用例
※個人アクセストークンは HTTPS Git 操作だけにしか使用できません。
```sh
[Giganscudo-Duro@fedora 01_GoLang]$ git push --set-upstream origin go-sse
Username for 'https://github.com': Giganscudo-Duro
Password for 'https://Giganscudo-Duro@github.com':  <- ここでトークンを入力
Enumerating objects: 9, done.
Counting objects: 100% (9/9), done.
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 1.30 KiB | 1.30 MiB/s, done.
Total 5 (delta 2), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
remote:
remote: Create a pull request for 'go-sse' on GitHub by visiting:
remote:      https://github.com/Giganscudo-Duro/K-Project/pull/new/go-sse
remote:
To https://github.com/Giganscudo-Duro/K-Project.git
 * [new branch]      go-sse -> go-sse
 branch 'go-sse' set up to track 'origin/go-sse'.
``` 


# 参考URL
- [GitHubがパスワード認証を廃止するらしいので]( https://qiita.com/shiro01/items/e886aa1e4beb404f9038 )
- [個人用アクセス トークンの作成]( https://docs.github.com/ja/github/authenticating-to-github/creating-a-personal-access-token )
