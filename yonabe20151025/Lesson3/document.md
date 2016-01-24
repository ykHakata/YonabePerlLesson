# cookbook.pl 仕様案

データベースの設計について

    今回の cookbook アプリは検索だけでなく、
    新しいレシピの追加、レシピの変更などの機能を追加予定
    テキストファイルの読み込みによる検索がすでに複雑であり、
    タイトルからの検索だけでなく、材料からの検索や
    項目の追加などを考慮した場合、リレーショナルな
    データーベース設計をしていかないと、
    非常にコードが複雑になってしまうため、
    現状はアプリケーションを開発する場合 Perl だけでなく
    SQL という問い合わせ言語に対応したデータベースを
    活用するやり方が一般的。

データベース設計のコツ

    エクセルの方眼紙をイメージして、一枚書いてみる

    原文:
    タイトル:余りクッキーパウンドケーキ
    材料:クッキー 200g,小麦粉 100g,卵 1個,牛乳 100cc,ベーキングパウダー 5g,砂糖 20g
    作り方:1 | クッキーを袋などに入れて砕く。 このとき、細かく砕いたのと粗めと適当に砕いておく。 オーブン180度で余熱スタート,2 | 牛乳と卵と砂糖をボウルに入れてよく混ぜる。 そこへ、１で砕いたクッキーを混ぜ入れる。,3 | 2のボウルに、小麦粉とベーキングパウダーを混ぜ入れる。このとき、粉はふるう必要ありません,4 | ちょっと生地がこってり固いと感じれば、少し牛乳を足して調整してください。 後は、オーブンで30分程度焼いたら完成
    ポイント:クッキーは、細か目に砕くのと、ちょっと粗めに砕くの二種類作るといいかも

    例:
    title: タイトル (例: 余りクッキーパウンドケーキ)
    foodstuff: 材料 (例: クッキー)
    count: 個数 (例: 200g)
    recipe: 作り方 (例: クッキーを袋などに入れて砕く。..)
    point: ポイント (例: クッキーは、細か目に..)

    id | title    | foodstuff | count | recipe       | point          |
    1  | 余りク.. | クッキー  | 200g  | クッキーを.. | クッキーは、.. |
    2  | 余りク.. | 小麦粉    | 100g  | クッキーを.. | クッキーは、.. |
    3  | 余りク.. | 卵        | 1個   | クッキーを.. | クッキーは、.. |
    4  | 余りク.. | 牛乳      | 100cc | クッキーを.. | クッキーは、.. |
    5  | 余りク.. | ベーキ... | 5g    | クッキーを.. | クッキーは、.. |
    6  | 余りク.. | 砂糖      | 20g   | クッキーを.. | クッキーは、.. |

    このテーブル設計はすでに無理がありそうである。

    データベースの正規化(せいきか)を行う。

    しかし、この手のレシピの場合正規化を行うのは難しい。
    なぜなら、卵一つにしてもいろいろな卵が存在し、食材は、ほぼ無限に近い
    ほどの多様性があることが想定され、いたずらに分類分けし始めると
    終わりがなくなってしまう。

    アプローチを変える。

    例:
    TABLE NAME: recipe
    id: ID (例: 1)
    title: タイトル (例: 余りクッキーパウンドケーキ)
    foodstuff: 材料 (例: クッキー 200g,.. )
    recipe: 作り方 (例: クッキーを袋などに入れて砕く。..)
    point: ポイント (例: クッキーは、細か目に..)
    create_ts: 新規日時 (例: 2015-10-25 16:00:00)
    modified_ts 修正日時(例: 2015-10-25 16:00:00)

    id | title    | foodstuff          | recipe       | point          |
    1  | 余りク.. | クッキー 200g, ..  | クッキーを.. | クッキーは、.. |

    TABLE NAME: foodstuff_label
    id: ID (例: 1)
    recpe_id: レシピID (例: 1 )
    foodstuff_id: 食材ID (例: 2 )
    create_ts: 新規日時 (例: 2015-10-25 16:00:00)
    modified_ts 修正日時(例: 2015-10-25 16:00:00)

    id | recpe_id | foodstuff_id |
    1  | 1        | 1            |
    2  | 1        | 2            |

    TABLE NAME: foodstuff
    id: ID (例: 1 )
    name: 食材名 (例: 小麦粉 )
    create_ts: 新規日時 (例: 2015-10-25 16:00:00)
    modified_ts 修正日時(例: 2015-10-25 16:00:00)

    TABLE NAME: foodstuff
    id | name |
    1  | 小麦粉 |
    2  | 卵 |
    3  | 牛乳 |

    食材による検索を実現するためのロジック

    検索可能な食材名を foodstuff テーブルより取得する
    食材名を選択すると foodstuff_id は判明
    foodstuff_id から foodstuff_type テーブルを検索すると、 recpe_id 判明
    recipe_id から表示したいレシピを特定し表示

    データーベース設計はできるだけ正規化した方が望ましいが、
    いたずらに正規化を試みる前に、作ろうとしているシステムの目的を押さえておく

    料理を作る方の感覚で行くと、砂糖というのは食材というより、
    調味料の類、砂糖を使う料理という検索の仕方は、料理を作る人間は
    あまりやらないやり方。
    しかし、料理の世界は奥が深く、調味料と思っているものを食材として活用したり
    またその逆も存在するため、必要と感じる都度にラベルのような形で新しくつくり
    レシピにラベルを貼り付けるアプローチを今回は実践してみる。

具体的なデータベースの作成方法 (SQLite3)

    sqlite3 が使えることの確認

    $ which sqlite3
    /usr/bin/sqlite3

    データベースファイルを保存したいディレクトリに移動
    cd ~/yonabe20151025/Lesson3/Note/

    今回は SQLite3 を実行して、 SQL 文を書いたテキストファイルを読み込ませながら
    実行するやる方を行う。

    テーブルを作成するときに読み込むファイル
    create_table_recipe.sql
    create_table_foodstuff_label.sql
    create_table_foodstuff.sql

    テーブルを削除するときに読み込むファイル
    drop_table_recipe.sql
    drop_table_foodstuff_label.sql
    drop_table_foodstuff.sql

    データーを新規作成するときに読み込むファイル
    insert_recipe.sql
    insert_foodstuff_label.sql
    insert_foodstuff.sql

    データーを変更するときに読み込むファイル
    update_recipe.sql
    update_foodstuff_label.sql
    update_foodstuff.sql

    データーを削除するときに読み込むファイル
    delete_recipe.sql
    delete_foodstuff_label.sql
    delete_foodstuff.sql

    データーを検索するときに読み込むファイル
    search_cookbook.sql

    SQLite を データーベースファイルを指定しながら起動
    データーベースファイル名: cookbook.db

    $ sqlite3 cookbook.db
    SQLite version 3.8.5 2014-08-15 22:37:57
    Enter ".help" for usage hints.
    sqlite> 

    sqlite が起動する、別途、テキストエディッタで作成すみの
    create_table_recipe.sql ファイルを読み込んで
    recipe テーブルを作成する

    sqlite> .read ./create_table_recipe.sql 

    テーブルが作成されたことの確認

    sqlite> .table
    recipe

    作成されているテーブルの構造(スキーマー)確認

    sqlite> .schema
    CREATE TABLE recipe (
        id          INTEGER,
        title       TEXT,
        foodstuff   TEXT,
        recipe      TEXT,
        point       TEXT,
        create_ts   TEXT,
        modified_ts TEXT
    );
    sqlite> 

    同様の手順で、 foodstuff_label, foodstuff のテーブルを作成

    sqlite> .read ./create_table_foodstuff_label.sql
    sqlite> .read ./create_table_foodstuff.sql

    余力があったら、テーブルを削除する sql ファイルも作っておいて
    試しに削除と新規作成を繰り返してみる

    サンプルデータをテーブルに登録してみる。
    書きファイルを完成させる

    insert_recipe.sql
    insert_foodstuff_label.sql
    insert_foodstuff.sql

    インサートを実行する

    sqlite> .read ./insert_recipe.sql
    sqlite> .read ./insert_foodstuff.sql
    sqlite> .read ./insert_foodstuff_label.sql

    表示の仕方を変更する
    .mode line

    データーができたことの確認
    sqlite> select * from recipe;
    sqlite> select * from foodstuff_label;
    sqlite> select * from foodstuff;

    様々な検索方法でデータを検索表示する、下記ファイルを作成後、実行

    sqlite> .read ./search_cookbook.sql

    資料を参考にしながら、自分なりの組み合わせを考えて見る

