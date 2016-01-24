-- recipe テーブルのテーブル構造 スキーマー

CREATE TABLE recipe (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    title       TEXT,
    foodstuff   TEXT,
    recipe      TEXT,
    point       TEXT,
    create_ts   TEXT,
    modified_ts TEXT
);

-- sql 文は慣例的に大文字を使う
-- sqlite は動的にデータの型が変わるので、データー型の指定は無しでも可能

-- TABLE NAME: recipe
-- id: ID (例: 1)
-- title: タイトル (例: 余りクッキーパウンドケーキ)
-- foodstuff: 材料 (例: クッキー 200g,.. )
-- recipe: 作り方 (例: クッキーを袋などに入れて砕く。..)
-- point: ポイント (例: クッキーは、細か目に..)
-- create_ts: 新規日時 (例: 2015-10-25 16:00:00)
-- modified_ts 修正日時(例: 2015-10-25 16:00:00)
