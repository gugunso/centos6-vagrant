# centos6-vagrant
centos6の初期化


## eccube2-mysql
eccube2系をmysqlで動かすのに必要な環境を作ります。
詳しくは、各ファイルの中身を見て下さい。

### install_eccube2_enviroment.sh
必要なミドルウェア等のインストール、DB作成などを行います。
PHP 5.6
Mysql 5.6

下記内容で作成します。
DB名：eccube_dev
DBユーザ名：develop
DBパスワード：password

必要な場合は適宜変更して下さい。

### install_eccube2_13_5.sh
ECCUBE2.13.5をダウンロードして展開、
ドキュメントルートを書き換えます。

※既存プロジェクトなど、2.13.5ソースコードが不要な場合、

config.vm.provision :shell, :path => "install_eccube2_13_5.sh"
をコメントアウトして下さい。


