# centos6-vagrant
vagrantでcentos6を立ててサクッと開発環境構築するためのファイルです。  
開発用なので、クソ適当です。絶対に本番運用しないでください。

## eccube2
eccube2系用のミドルウェアをインストールし、2.13.5のソースコードをデプロイします。

### usage
ファイルを手元に落として、vagrant up すればOKです。
必要な場合は、Vagrantfileにネットワークの設定など適宜行ってください。


```
git clone https://github.com/gugunso/centos6-vagrant
cd centos6-vagrant/eccube2
vagrant up
```

成功するとprovisionが走り、諸々インストールされ、設定が上書きなどされます。

※provisionが終わった後、一度reloadして下さい。
reloadしないと、
 selinux = disabled 
の設定が反映されないため、synced_folderをapacheドキュメントルートに指定出来ません。


```
vagrant reload
```

reload し終わったら、ブラウザからアクセスすればeccube2.13.5のインストール画面が表示されます。


### install_eccube2_enviroment.sh
ミドルウェアのインストール、DB作成などを行います。
- PHP 5.6
- Mysql 5.6
- Postgresql 9.6

Mysql、Postgresql共に、下記内容で作成します。
- DB名：eccube_dev
- DBユーザ名：develop
- DBパスワード：password

必要に応じ、適宜変更して下さい。

### install_eccube2_13_5.sh
ECCUBE2.13.5をダウンロードして展開、
ドキュメントルートを書き換えます。

※既存プロジェクトなど、2.13.5ソースコードが不要な場合、

config.vm.provision :shell, :path => "install_eccube2_13_5.sh"
をコメントアウトして下さい。


## eccube3
eccube3系を動作させるのに必要な環境を作ります。

