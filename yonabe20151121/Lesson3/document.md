# Lesson1 SQLite3 と連携させた Perl スクリプトを作成

手元の環境を整える

    Win の場合

    参考 Perl インストール
    http://www.perlplus.jp/perlinstall/

    参考 SQLite3 インストール
    http://www.dbonline.jp/sqliteinstall/

    Mac の場合

    SQLite3 はインストール済みなのでそのまま

    Perl さくらインターネットと近い環境を構築する

    手順

    plenv(Perlバージョン管理)

        https://github.com/tokuhirom/plenv

    システムの Perl は使わず開発用にインストール

    plenv がインストールされているか確認

        plenv --version
        plenv 2.1.1-35-gf4f7a56

    plenv がインストールされてなければインストール

    公式サイト

        https://github.com/tokuhirom/plenv

    参考サイト

        http://www.omakase.org/perl/plenv.html
        http://blog.papix.net/entry/2013/06/04/081554
        http://perldoc.jp/docs/articles/github.com/tokuhirom/plenv/blob/master/README.md

    インストール

        git clone git://github.com/tokuhirom/plenv.git ~/.plenv

        echo 'export PATH="$HOME/.plenv/bin:$PATH"' >> ~/.bash_profile

        echo 'eval "$(plenv init -)"' >> ~/.bash_profile

        exec $SHELL -l

        git clone git://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build/

    Perl インストール

    今回は 5.14.4 をインストール

        plenv install 5.14.4

    仕上げ

        plenv rehash

    システム Perl から plenv でインストールした Perl に変更

        plenv global 5.14.4

    確認

        plenv versions
          system
        * 5.14.4 (set by /Users/yk/.plenv/version)

    cpanm をインストール

        plenv install-cpanm

    確認

        which cpanm
        /Users/yk/.plenv/shims/cpanm

    ## モジュール追加

    Carton (cpan モジュールを管理)

        cpanm Carton

    参考

        https://metacpan.org/pod/Carton

    確認

        carton -v
        carton v1.0.22

    Perl::Tidy (ソースコードの整形)

        cpanm Perl::Tidy

    参考

        https://metacpan.org/pod/Perl::Tidy

    確認

        perltidy -v
        This is perltidy, v20150815

        Copyright 2000-2015, Steve Hancock

        Perltidy is free software and may be copied under the terms of the GNU
        General Public License, which is included in the distribution files.

        Complete documentation for perltidy can be found using 'man perltidy'
        or on the internet at http://perltidy.sourceforge.net.

Perl モジュールを追加する

    必要なモジュールは CGI DBI DBD::SQLite
    だが、CGI は標準モジュールで組み込まれており
    DBI と DBD::SQLite を追加の必要がある
    DBI は DBD::SQLite の依存モジュールなので、DBD::SQLite をインストール

    Win の場合

        PPM コマンドを使う

    Mac の場合

    カートンインストールを使う
    $ carton install
    (カートンインストールは cpanfile というファイルを読みこんで実行する)

    以降は
    $ carton exec -- perl cookbook_simple.cgi
    というように、carton exec -- をつけることに注意

データベースを作成

    前回つくったレシピ検索のデーターベースを流用して、SQLite3 のデーターベース
    ファイルを作成してみる。

    データベースファイルを保存したいディレクトリに移動
    cd ~/yonabe20151121/Lesson3/Note/
    (環境によってパス違う場合があるので注意)

    SQLite を データーベースファイルを指定しながら起動
    データーベースファイル名: cookbook.db

    $ sqlite3 cookbook.db
    SQLite version 3.8.5 2014-08-15 22:37:57
    Enter ".help" for usage hints.
    sqlite> 

    sqlite が起動する、別途、テキストエディッタで作成すみの
    create_table.sql ファイルを読み込んでテーブルを作成する

    sqlite> .read ./create_table.sql

    テーブルが作成されたことの確認

    sqlite> .table
    foodstuff        foodstuff_label  recipe

    insert_data.sql ファイルを読み込んでサンプルデータ完成させる
    インサートを実行する

    sqlite> .read ./insert_data.sql

    表示の仕方を変更する
    sqlite> .mode line

    データーができたことの確認
    sqlite> select * from recipe;

    終了
    sqlite> .q

レシピ検索(簡易版) を作成してみる

    Lesson3/Sample/cookbook_simple.cgi を参考に
    Lesson3/Note/cookbook_simple.cgi を完成させる

まとめ

    データーを保存させる場合、 SQLite3 などのデーターベースアプリと連携させる
    CGI とは WEB サーバーとプログラミング言語とやり取りするための規格
    WEB アプリで利用するプログラミング言語は Perl 以外でも
    WEB サーバーが起動している OS 上で稼働することの言語であれば何でも流用は可能
