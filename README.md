# centos6-vagrant
vagrantでcentos6を立ててサクッと開発環境構築するためのファイル群です。  
開発用なので、色々適当です。


# usage
チェックアウトし、立ち上げたい環境のディレクトリに移動してvagrant up する。

```
git clone https://github.com/gugunso/centos6-vagrant
cd centos6-vagrant/eccube3
vagrant up
```

vagrant-reload プラグインが入っている場合、以上で終了。

vagrant-reload プラグインが入っていない場合は、vagrant reloadする。
```
vagrant reload
```

※必要であれば、各ディレクトリのVagrantfileを編集して、ネットワーク設定等を適宜行う。

# info 
## version
ミドルのバージョンは、各シェルの中を参照。

### ECCUBE2系
- PHP 5.6
- Mysql 5.6
- Postgresql 9.6

### ECCUBE3系
- PHP 7.0
- Mysql 5.6
- Postgresql 9.6

## Databese 
Mysql、Postgresql共に、下記内容で作成します。
- DB名：eccube_dev
- DBユーザ名：develop
- DBパスワード：password

## メモ
ミドルウェアの設定、インストール  
と  
アプリケーション本体のインストールは
別のシェルに書いてあるので、既存プロジェクトなどの場合は後者をコメントアウトすればよい。


# 参考

VagrantのShell Provisionerはrootで実行される
https://qiita.com/pasela/items/906291647c4f97b9a7c7

EC-CUBE3のメモ - 開発環境 -
https://qiita.com/chihiro-adachi/items/645fee870d50a985dc88
https://github.com/chihiro-adachi/eccube3-vagrant

※provisioning 後に自動でリロードしたければ、この辺を入れる
https://github.com/exratione/vagrant-provision-reboot
https://github.com/aidanns/vagrant-reload

