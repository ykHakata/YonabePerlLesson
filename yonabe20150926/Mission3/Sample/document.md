# address_book.pl 仕様案

ミッション３

架空の個人情報を作り出すシステム

    perl address_book.pl

    >> address book start? [start/stop]
    >> start
    >>
    >> * * * main menu * * *
    >> search zipcode address [1]
    >> search tel name us [2]
    >> search tel address and name us [3]
    >> create dummy address [4]
    >> address book stop [stop]
    >> * * * end * * *
    >> 4
    >>
    >> * * * create dummy address [4] * * *
    >> address count? [1-10]
    >> * * * end * * *
    >> 5
    >>
    >> * * * result create dummy address [4] * * *
    >> 1 | 090-0097-6804 | 榎本 璃子 | えのもと りこ | 8010876 | 福岡県 | 北九州市門司区 | 花月園 | 
    >> 2 | 090-0264-5861 | 原 樹里 | はら じゅり | 8360076 | 福岡県 | 大牟田市 | 三里町 | 
    >> 3 | 080-6986-6793 | 小口 雄太 | おぐち ゆうた | 8090035 | 福岡県 | 中間市 | 松ケ岡 | 
    >> 4 | 090-6643-1348 | 岡崎 良介 | おかざき りょうすけ | 8380111 | 福岡県 | 小郡市 | 吹上 | 
    >> 5 | 080-4674-7025 | 役所 亜希 | やくしょ あき | 8201103 | 福岡県 | 鞍手郡小竹町 | 勝野 | 
    >> * * * end * * *
    >>
    >> * * * create dummy address [4] * * *
    >> address count? [1-10]
    >> * * * end * * *
    >> 20
    >>
    >> * * * result create dummy address [4] * * *
    >> not count 1 - 10 only!
    >> * * * end * * *
    >>
    >> * * * main menu * * *
    >> search zipcode address [1]
    >> search tel name us [2]
    >> search tel address and name us [3]
    >> create dummy address [4]
    >> address book stop [stop]
    >> * * * end * * *
    >> stop
    >>
    >> thank you bye!!

全体的な構成

    * address book (アプリケーション全体)
        * start menu (スタートメニュー)
            * main menu (メインメニュー)
                * search zipcode address (郵便番号検索)
                    * zipcode_address_menu (入力画面メニュー)
                    * get_validate_value (入力値検証して取得)
                    * search (検索実行)
                    * view_result (結果表示画面)
                * search tel name us (電話番号検索)
                    * tel_name_us_menu (入力画面メニュー)
                    * get_validate_value (入力値検証して取得)
                    * search (検索実行)
                    * view_result (結果表示画面)
                * search tel address and name us (電話番号住所録検索)
                    * tel_address_and_name_us_menu (入力画面メニュー)
                    * get_validate_value (入力値検証して取得)
                    * search (検索実行)
                    * view_result (結果表示画面)
                * create dummy address (架空の個人情報作成)
                    * create_dummy_address_menu (入力画面メニュー)
                    * get_validate_value (入力値検証して取得)
                    * create (作成実行)
                    * view_result (結果表示画面)

start menu (スタートメニュー) の遷移

    start, stop 以外の文字入力 -> もう一度 address book start? 表示

main menu (メインメニュー) の遷移

    1, 2, 3, 4, stop, 以外の文字入力 -> もう一度 main menu 表示

zipcode_address_menu (入力画面メニュー) の遷移

    3桁の数字の場合 -> 郵便番号上から3桁に該当する郵便番号検索
    3桁、ハイフン、4桁 -> 完全に一致する郵便番号検索
    該当する郵便番号ない場合 -> none address! とコメント表示
    *** or ***-**** 以外の形式入力の場合 -> none address! とコメント表示

tel_name_us_menu (入力画面メニュー) の遷移

    3桁、- 、4桁、- 、3桁 -> 完全に一致する電話番号検索
    該当する電話番号ない場合 -> none name us! とコメント表示
    ***-****-**** 以外の形式入力の場合 -> none name us! とコメント表示

tel_address_and_name_us_menu (入力画面メニュー) の遷移

    3桁、- 、4桁、- 、3桁 -> 完全に一致する電話番号検索
    該当する電話番号ない場合 -> none address and name us! とコメント表示
    ***-****-**** 以外の形式入力の場合 -> none address and name us! とコメント表示


create_dummy_address_menu (入力画面メニュー) の遷移

    1 から 10 -> 入力された数だけ架空の住所を作成
    1 から 10 以外の入力の場合 main menu 表示
