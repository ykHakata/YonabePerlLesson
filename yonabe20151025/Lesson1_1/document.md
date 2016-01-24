# cookbook.pl 仕様案

実装の順番

    cookbook.pl
    SearchFood.pm
    ViewMenu.pm
    GetValidateValue.pm
    Search.pm
    ViewResult.pm

料理レシピを検索するシステム

    クックパット風、お料理レシピデータベース

    $ perl cookbook.pl

    >> cookbook start? [start/stop]
    >> stop
    >>
    >> thank you bye!!

    $ perl cookbook.pl

    >> cookbook start? [start/stop]
    >> start
    >>
    >> * * * main menu * * *
    >> [1] search cookbook
    >> [stop] cookbook stop
    >> * * * end * * *
    >> 1
    >>
    >> * * * search cookbook * * *
    >> [1] search food
    >> [0] main menu
    >> * * * end * * *
    >> 1
    >>
    >> * * * search food * * *
    >> [1] 余りクッキーパウンドケーキ
    >> [2] さつま芋ごはん
    >> [3] とろろ昆布と桜海老のお吸い物
    >> [4] 白菜チョレギサラダ
    >> [5] ニラもやしあんかけ炒め
    >> [0] search cookbook
    >> * * * end * * *
    >> 1
    >>
    >> * * * 余りクッキーパウンドケーキ * * *
    >>
    >> * * 材料 * *
    >> クッキー 200g
    >> 小麦粉 100g
    >> 卵 1個
    >> 牛乳 100cc
    >> ベーキングパウダー 5g
    >> 砂糖 20g
    >>
    >> * * 作り方 * *
    >> 1 | クッキーを袋などに入れて砕く。 このとき、細かく砕いたのと粗めと適当に砕いておく。 オーブン180度で余熱スタート
    >> 2 | 牛乳と卵と砂糖をボウルに入れてよく混ぜる。 そこへ、１で砕いたクッキーを混ぜ入れる。
    >> 3 | 2のボウルに、小麦粉とベーキングパウダーを混ぜ入れる。このとき、粉はふるう必要ありません
    >> 4 | ちょっと生地がこってり固いと感じれば、少し牛乳を足して調整してください。 後は、オーブンで30分程度焼いたら完成
    >>
    >> * * ポイント * *
    >> クッキーは、細か目に砕くのと、ちょっと粗めに砕くの二種類作るといいかも
    >>
    >> * * * end * * *
    >>
    >> * * * search food * * *
    >> [1] 余りクッキーパウンドケーキ
    >> [2] さつま芋ごはん
    >> [3] とろろ昆布と桜海老のお吸い物
    >> [4] 白菜チョレギサラダ
    >> [5] ニラもやしあんかけ炒め
    >> [0] search cookbook
    >> * * * end * * *
    >> 0
    >>
    >> * * * search cookbook * * *
    >> [1] search food
    >> [0] main menu
    >> * * * end * * *
    >> 0
    >>
    >> * * * main menu * * *
    >> [1] search cookbook
    >> [stop] cookbook stop
    >> * * * end * * *
    >> stop
    >>
    >> thank you bye!!

全体的な構成

    * cookbook (アプリケーション全体スタート)
        * start_menu (スタートメニュー)
            * main_menu (メインメニュー)
                * search_cookbook (レシピ検索)
                    * search_food (料理名によるレシピ検索)

個別の構成

    * cookbook (アプリケーション全体)

    * start_menu (スタートメニュー)
        * view_menu (メニュー画面表示)
        * get_validate_value (入力値取得から値検証をして再度取得)
        * redirect_menu (各メニューへの遷移)

    * main_menu (メインメニュー)
        * view_menu (メニュー画面表示)
        * get_validate_value (入力値取得から値検証をして再度取得)
        * redirect_menu (各メニューへの遷移)

    * search_cookbook (レシピ検索)
        * view_menu (メニュー画面表示)
        * get_validate_value (入力値取得から値検証をして再度取得)
        * redirect_menu (各メニューへの遷移)

    * search_food (料理名によるレシピ検索)
        * view_menu (メニュー画面表示)
        * get_validate_value (入力値取得から値検証をして再度取得)
        * search (検索実行)
        * view_result (結果表示画面)
        * redirect_menu (各メニューへの遷移)

search food (入力画面メニュー) の遷移

    >> * * * search food * * *
    >> [1] 余りクッキーパウンドケーキ
    >> [2] さつま芋ごはん
    >> [3] とろろ昆布と桜海老のお吸い物
    >> [4] 白菜チョレギサラダ
    >> [5] ニラもやしあんかけ炒め
    >> [0] search cookbook
    >> * * * end * * *
    >> 1
    >>
    >> * * * 余りクッキーパウンドケーキ * * *
    >>
    >> * * 材料 * *
    >> クッキー 200g
    >> 小麦粉 100g
    >> 卵 1個
    >> 牛乳 100cc
    >> ベーキングパウダー 5g
    >> 砂糖 20g
    >>
    >> * * 作り方 * *
    >> 1 | クッキーを袋などに入れて砕く。 このとき、細かく砕いたのと粗めと適当に砕いておく。 オーブン180度で余熱スタート
    >> 2 | 牛乳と卵と砂糖をボウルに入れてよく混ぜる。 そこへ、１で砕いたクッキーを混ぜ入れる。
    >> 3 | 2のボウルに、小麦粉とベーキングパウダーを混ぜ入れる。このとき、粉はふるう必要ありません
    >> 4 | ちょっと生地がこってり固いと感じれば、少し牛乳を足して調整してください。 後は、オーブンで30分程度焼いたら完成
    >>
    >> * * ポイント * *
    >> クッキーは、細か目に砕くのと、ちょっと粗めに砕くの二種類作るといいかも
    >>
    >> * * * end * * *
    >>

    0 -> search cookbook へ
    表示されている数字 -> 該当のメニュー詳細表示 へ
    それ以外 -> もう一度 search food を表示
