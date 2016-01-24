package ViewMenu;
use strict;
use warnings;
use utf8;

binmode STDOUT, ':encoding(UTF-8)';
binmode STDIN,  ':encoding(UTF-8)';

=encoding utf8

=head1 NAME (名前)

ViewMenu - メニュー画面表示

=head1 SYNOPSIS (概要)

cookbook アプリの各メニュー画面表示機能

=cut

=head2 start

    メニュー画面表示機能の起動

=cut

sub start {
    my $type = shift;
    die 'not type!!'          if !$type;
# TODO
    return _search_cookbook() if $type eq 'search_cookbook';
    return _search_food()     if $type eq 'search_food';
# TODO
    die 'Menu does not exist!!';
}

=head2 _menu_end (スタートメニュー終了)

    >>
    >> thank you bye!!

=cut

sub _menu_end {
# TODO




}

=head2 _main_menu (メインメニュー)

    >>
    >> * * * main menu * * *
    >> [1] search cookbook
    >> [stop] cookbook stop
    >> * * * end * * *
    >>

=cut

sub _main_menu {
# TODO








}

=head2 _search_cookbook (レシピ検索)

    >>
    >> * * * search cookbook * * *
    >> [1] search food
    >> [0] main menu
    >> * * * end * * *
    >>

=cut

sub _search_cookbook {
    my $msg
        = '>> ' . "\n"
        . '>> * * * search cookbook * * *' . "\n"
        . '>> [1] search food' . "\n"
        . '>> [0] main menu' . "\n"
        . '>> * * * end * * *' . "\n"
        . '>> ';
    print $msg;
    return;
}

=head2 _search_food (料理名によるレシピ検索)

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

=cut

sub _search_food {
    my $msg
        = '>> ' . "\n"
        . '>> * * * search food * * *' . "\n"
        . Search::start( 'food', 'title' )
        . '>> [0] search cookbook' . "\n"
        . '>> * * * end * * *' . "\n"
        . '>> ';
    print $msg;
    return;
}

1;

__END__
