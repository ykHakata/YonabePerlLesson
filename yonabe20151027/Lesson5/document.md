# SQL を活用したアプローチ

データベースの利用について

    Excel もある意味データベースの機能を備えていますし、
    兄弟分のアプリに アクセス という有料アプリもあります。
    基本的にデーターベースの考え方は同じですが、今回は SQLite3 という
    フリーで利用できるコマンドラインに特化したデーターベースアプリを紹介します。

データベース設計のコツ

    今回はデーターベース設計者などを目指している方を対象にしてはいませんので、
    本格的なシステム開発の業務で行うよなやり方とは違うやり方になっています。

    まずはわからないなりにも少しづつさわりながら慣れていきます。

    エクセルの方眼紙をイメージして、一枚書いてみる

    TABLE NAME: recipe
    stock_date: 日付 (例: '2015-10-09')
    opening_price: 始値 (例: 31500)
    high_price: 高値 (例: 31650)
    low_price: 安値 (例: 31100)
    closing_price: 終値 (例: 31400)
    volume: 出来高 (例: 781)
    trading_value: 売買代 (例: 24568200)

    日付       | 始値  | 高値  | 安値  | 終値  | 出来高 | 売買代金
    2015-10-09 | 31500 | 31650 | 31100 | 31400 | 781    | 24568200
    2015-10-08 | 32150 | 32600 | 30700 | 30700 | 3460   | 109493600
    ...

    今回はそのままのテーブルを作成してみます。

具体的なデータベースの作成方法 (SQLite3)

    sqlite3 が使えることの確認

    $ which sqlite3
    /usr/bin/sqlite3

    データベースファイルを保存したいディレクトリに移動
    cd ~/yonabe20151025/Lesson3/Note/

    今回は SQLite3 を実行して、 SQL 文を書いたテキストファイルを読み込ませながら
    実行するやる方を行う。

    -----

    テーブルを作成するときに読み込むファイル
    create_table_recipe.sql

    テーブルを削除するときに読み込むファイル
    drop_table_recipe.sql

    データーを新規作成するときに読み込むファイル
    stock.csv

    データーを検索するときに読み込むファイル
    search_stock.sql

    データーベースのファイル
    stock.db

    -----

    SQLite を データーベースファイルを指定しながら起動
    データーベースファイル名: stock_info.db

    $ sqlite3 stock_info.db
    SQLite version 3.8.5 2014-08-15 22:37:57
    Enter ".help" for usage hints.
    sqlite> 

    sqlite が起動する、別途、テキストエディッタで作成すみの
    create_table_stock.sql ファイルを読み込んで
    stock テーブルを作成する

    sqlite> .read ./create_table_stock.sql 

    テーブルが作成されたことの確認

    sqlite> .table
    stock

    作成されているテーブルの構造(スキーマー)確認

    sqlite> .schema
    CREATE TABLE stock (
        stock_date      TEXT,
        opening_price   INTEGER,
        high_price      INTEGER,
        low_price       INTEGER,
        closing_price   INTEGER,
        volume          INTEGER,
        trading_value   INTEGER
    );
    sqlite> 

    区切り文字を変更

    sqlite> .separator ,

    設定確認

    sqlite> .show
         echo: off
          eqp: off
      explain: off
      headers: off
         mode: list
    nullvalue: ""
       output: stdout
    separator: ","
        stats: off
        width: 
    sqlite> 

    事前に用意した、csv ファイルを読み込む

    sqlite> .import ./stock.csv stock
    sqlite> 

    データーができたことの確認
    sqlite> select * from stock;

    様々な検索方法でデータを検索表示する、下記ファイルを作成後、実行

    sqlite> .read ./search_stock.sql

    資料を参考にしながら、自分なりの組み合わせを考えて見る
