-- stock テーブルのテーブル構造 スキーマー

CREATE TABLE stock (
    stock_date      TEXT,
    opening_price   INTEGER,
    high_price      INTEGER,
    low_price       INTEGER,
    closing_price   INTEGER,
    volume          INTEGER,
    trading_value   INTEGER
);

-- sql 文は慣例的に大文字を使う
-- sqlite は動的にデータの型が変わるので、データー型の指定は無しでも可能
-- 通常はデータ通し番号 ID や 作成日(タイプスタンプ) create_ts などのカラムを作って
-- 作成日時を記録するのがよくやるやり方ですが、今回は作成していません。

-- TABLE NAME: recipe
-- stock_date: 日付 (例: '2015-10-09')
-- opening_price: 始値 (例: 31500)
-- high_price: 高値 (例: 31650)
-- low_price: 安値 (例: 31100)
-- closing_price: 終値 (例: 31400)
-- volume: 出来高 (例: 781)
-- trading_value: 売買代 (例: 24568200)
