CREATE TABLE `recipe` (
    `id`          INTEGER PRIMARY KEY AUTOINCREMENT,
    `title`       TEXT,
    `foodstuff`   TEXT,
    `recipe`      TEXT,
    `point`       TEXT,
    `create_ts`   TEXT,
    `modified_ts` TEXT
);

CREATE TABLE `foodstuff` (
    `id`          INTEGER PRIMARY KEY AUTOINCREMENT,
    `name`        TEXT,
    `create_ts`   TEXT,
    `modified_ts` TEXT
);

CREATE TABLE `foodstuff_label` (
    `id`              INTEGER PRIMARY KEY AUTOINCREMENT,
    `recpe_id`        INTEGER,
    `foodstuff_id`    INTEGER,
    `create_ts`       TEXT,
    `modified_ts`     TEXT
);

-- テーブルを作成する手順
-- データーベースを作りたいディレクトリに移動、下記コマンド
-- データーベースファイル名: cookbook.db

-- $ sqlite3 cookbook.db
-- SQLite version 3.8.5 2014-08-15 22:37:57
-- Enter ".help" for usage hints.
-- sqlite> 

-- sqlite が起動する、別途、テキストエディッタで作成すみの
-- create_table_recipe.sql ファイルを読み込んで
-- recipe テーブルを作成する

-- sqlite> .read ./create_table.sql

-- テーブルが作成されたことの確認

-- sqlite> .table

-- サンプルデータをテーブルに登録、インサートを実行

-- sqlite> .read ./insert_data.sql

-- 表示の仕方を変更する
-- .mode line

-- データーができたことの確認
-- sqlite> select * from recipe;

-- SQLite3 の終了
-- sqlite> .q

----------

-- sql 文は慣例的に大文字を使う
-- sqlite は動的にデータの型が変わるので、データー型の指定は無しでも可能

----------

-- recipe テーブルのテーブル構造 スキーマー
-- TABLE NAME: recipe
-- id: ID (例: 1)
-- title: タイトル (例: 余りクッキーパウンドケーキ)
-- foodstuff: 材料 (例: クッキー 200g,.. )
-- recipe: 作り方 (例: クッキーを袋などに入れて砕く。..)
-- point: ポイント (例: クッキーは、細か目に..)
-- create_ts: 新規日時 (例: 2015-10-25 16:00:00)
-- modified_ts 修正日時(例: 2015-10-25 16:00:00)

----------

-- foodstuff テーブルのテーブル構造 スキーマー
-- TABLE NAME: foodstuff
-- id: ID (例: 1 )
-- name: 食材名 (例: 小麦粉 )
-- create_ts: 新規日時 (例: 2015-10-25 16:00:00)
-- modified_ts 修正日時(例: 2015-10-25 16:00:00)

----------

-- foodstuff_label テーブルのテーブル構造 スキーマー
-- TABLE NAME: foodstuff_label
-- id: ID (例: 1)
-- recpe_id: レシピID (例: 1 )
-- foodstuff_id: 食材ID (例: 2 )
-- create_ts: 新規日時 (例: 2015-10-25 16:00:00)
-- modified_ts 修正日時(例: 2015-10-25 16:00:00)
