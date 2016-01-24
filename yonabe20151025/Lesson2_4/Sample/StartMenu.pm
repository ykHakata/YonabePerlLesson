package StartMenu;
use strict;
use warnings;
use utf8;
use ViewMenu;
use GetValidateValue;
use RedirectMenu;
use MainMenu;

binmode STDOUT, ':encoding(UTF-8)';
binmode STDIN,  ':encoding(UTF-8)';

=encoding utf8

=head1 NAME (名前)

StartMenu - スタートメニュー

=head1 SYNOPSIS (概要)

スタートメニュー表示、選択メニューへの遷移

=cut

=head2 start

    スタートメニュー起動

=cut

sub start {
    my $type = 'start_menu';
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

    * start_menu (スタートメニュー)
        * view_menu (メニュー画面表示)
        * get_validate_value (入力値取得から値検証をして再度取得)
        * redirect_menu (各メニューへの遷移)

start menu (スタートメニュー) の遷移

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
    >>

    start -> main menu へ
    stop -> 'thank you bye!!' 表示後終了
    それ以外 -> もう一度 start menu を表示

=cut
