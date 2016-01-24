package SearchFood;
use strict;
use warnings;
use utf8;
use ViewMenu;
use Search;
use GetValidateValue;
use ViewResult;

binmode STDOUT, ':encoding(UTF-8)';
binmode STDIN,  ':encoding(UTF-8)';

=encoding utf8

=head1 NAME (名前)

SearchFood - 料理名によるレシピ検索

=head1 SYNOPSIS (概要)

料理名によるレシピ検索メニュー表示、選択メニューへの遷移

=cut

=head2 start

    料理名によるレシピ検索メニュー起動

=cut

sub start {
    my $type = 'search_food';
    ViewMenu::start($type);
    my $value = GetValidateValue::start($type);
    return if $value eq '' || $value eq '0';
    $value = Search::start( $type, $value );
    ViewResult::start( $type, $value );
    return;
}

1;

__END__

=head1 SEE ALSO (参照)

全体的な構成

    * cookbook (アプリケーション全体スタート)
        * start_menu (スタートメニュー)
            * main_menu (メインメニュー)
                * search_cookbook (レシピ検索)
                    * search_food (料理名によるレシピ検索)

個別の構成

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

=cut
