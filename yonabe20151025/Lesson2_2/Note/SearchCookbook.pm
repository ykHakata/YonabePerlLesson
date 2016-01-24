package SearchCookbook;
use strict;
use warnings;
use utf8;
use SearchFood;
use ViewMenu;
use GetValidateValue;
use RedirectMenu;
# TODO
binmode STDOUT, ':encoding(UTF-8)';
binmode STDIN,  ':encoding(UTF-8)';

=encoding utf8

=head1 NAME (名前)

SearchCookbook - レシピ検索

=head1 SYNOPSIS (概要)

レシピ検索メニュー表示、選択メニューへの遷移

=cut

=head2 start

    レシピ検索メニュー起動

=cut

sub start {
    my $type = 'search_cookbook';
    ViewMenu::start($type);
    my $value = GetValidateValue::start($type);
    RedirectMenu::start( $type, $value );
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

    * search_cookbook (レシピ検索)
        * view_menu (メニュー画面表示)
        * get_validate_value (入力値取得から値検証をして再度取得)
        * redirect_menu (各メニューへの遷移)

search cookbook (入力画面メニュー) の遷移

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
    >>

    1 -> search food へ
    0 -> main menu へ
    それ以外 -> もう一度 search cookbook を表示

=cut
