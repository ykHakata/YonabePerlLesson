-- 様々な検索方法

-- recipe (レシピ) テーブルのすべての情報を表示する

-- TODO

-- foodstuff (食材) テーブルのすべての情報を表示する

-- TODO

-- foodstuff_label (食材ラベル) テーブルのすべての情報を表示する

-- TODO

-- 食材ラベル、「小麦粉」がついているレシピのタイトルだけ表示

-- TODO






-- 食材ラベル、「卵」がついているレシピのタイトルだけ表示

-- TODO






-- 食材ラベル、「ニラ」がついているレシピのタイトルだけ表示

-- TODO






-- 食材ラベル、「小麦粉」もしくは「ニラ」がついているレシピのタイトルだけ表示

-- TODO







-- レシピ NO,1 についている食材ラベルを調べる

-- TODO






-- このようなデータベースの検索を Perl のスクリプトだけで実現しようとなると
-- 非常に困難になってなってくるため、sql 文で検索をかけた後で情報を取得する

-- このようなテーブルを結合させて検索するやり方でイメージがつきにくい場合
-- エクセルのシートをイメージして、書き起こすとよい

-- recipe                       | foodstuff_label          | foodstuff
-- title                   | id | recipe_id | foodstuff_id | id | name
-- 'ニラもやしあんかけ炒め'| 5  | 5         | 5            | 5  |'ニラ'

-- 上記の条件ですべてのカラムを表示する SQL

-- TODO





