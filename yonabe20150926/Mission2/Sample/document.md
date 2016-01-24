# address_book.pl 仕様案

ミッション２

電話番号から名前を検索するシステム

    perl address_book.pl

    >> address book start? [start/stop]
    >> start
    >>
    >> * * * main menu * * *
    >> search zipcode address [1]
    >> search tel name us [2]
    >> address book stop [stop]
    >> * * * end * * *
    >> 2
    >>
    >> * * * search tel name us [2] * * *
    >> tel? [***-****-****]
    >> * * * end * * *
    >> 080-9300-8793
    >>
    >> * * * result search tel name us [2] * * *
    >> 1 | 片瀬 進 | かたせ すすむ | 080-9300-8793 |
    >> * * * end * * *
    >>
    >> * * * main menu * * *
    >> search zipcode address [1]
    >> search tel name us [2]
    >> address book stop [stop]
    >> * * * end * * *
    >> 2
    >>
    >> * * * search tel name us [2] * * *
    >> tel? [***-****-****]
    >> * * * end * * *
    >> 999-9999-9999
    >>
    >> * * * result search tel name us [2] * * *
    >> none name us!
    >> * * * end * * *
    >>
    >> * * * search tel name us [2] * * *
    >> tel? [***-****-****]
    >> * * * end * * *
    >> fukuoka
    >>
    >> * * * result search tel name us [2] * * *
    >> none name us!
    >> * * * end * * *
    >>
    >> * * * main menu * * *
    >> search zipcode address [1]
    >> search tel name us [2]
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

start menu (スタートメニュー) の遷移

    start, stop 以外の文字入力 -> もう一度 address book start? 表示

main menu (メインメニュー) の遷移

    1, 2, stop, 以外の文字入力 -> もう一度 main menu 表示

zipcode_address_menu (入力画面メニュー) の遷移

    3桁の数字の場合 -> 郵便番号上から3桁に該当する郵便番号検索
    3桁、ハイフン、4桁 -> 完全に一致する郵便番号検索
    該当する郵便番号ない場合 -> none address! とコメント表示
    *** or ***-**** 以外の形式入力の場合 -> none address! とコメント表示

tel_name_us_menu (入力画面メニュー) の遷移

    3桁、- 、4桁、- 、3桁 -> 完全に一致する電話番号検索
    該当する電話番号ない場合 -> none name us! とコメント表示
    ***-****-**** 以外の形式入力の場合 -> none name us! とコメント表示
