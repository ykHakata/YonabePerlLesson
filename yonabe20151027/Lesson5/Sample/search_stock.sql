-- 様々な検索方法

-- stock (株価) テーブルのすべての情報を表示する

SELECT * FROM stock;

-- stock_date 日付を指定して検索

-- SELECT *
-- FROM stock
-- WHERE stock_date = '2015-10-07';

-- high_price 高値 を指定して検索

-- SELECT *
-- FROM stock
-- WHERE high_price = '31650';


-- high_price 高値 で並び替え(小さい順)

-- SELECT *
-- FROM stock
-- ORDER BY high_price ASC;

-- high_price 高値 で並び替え(大きい順)

-- SELECT *
-- FROM stock
-- ORDER BY high_price DESC;
