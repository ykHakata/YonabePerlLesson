package RedirectMenu;
use strict;
use warnings;
use utf8;

binmode STDOUT, ':encoding(UTF-8)';
binmode STDIN,  ':encoding(UTF-8)';

=encoding utf8

=head1 NAME (名前)

RedirectMenu - 各メニューへの遷移

=head1 SYNOPSIS (概要)

cookbook アプリの各メニュー画面への遷移

=cut

=head2 start

    各メニューへの遷移

=cut

sub start {
    my $type  = shift;
    my $value = shift;
    die 'not type!!'                if !$type;
    return _start_menu($value)      if $type eq 'start_menu';
    return _main_menu($value)       if $type eq 'main_menu';
    return _search_cookbook($value) if $type eq 'search_cookbook';
    return _search_food($value)     if $type eq 'search_food';
    die 'Redirec does not exist!!';
}

=head2 _start_menu (スタートメニューの遷移)

    start -> main menu へ
    stop -> 'thank you bye!!' 表示後終了
    それ以外 -> もう一度 start menu を表示

=cut

sub _start_menu {
    my $value = shift;
    return MainMenu::start() if $value eq 'start';
    return ViewMenu::start('menu_end') if $value eq 'stop';
    return StartMenu::start();
}

=head2 _main_menu (メインメニューの遷移)

    1 -> search cookbook へ
    stop -> 'thank you bye!!' 表示後終了
    それ以外 -> もう一度 main menu を表示

=cut

sub _main_menu {
    my $value = shift;
    return SearchCookbook::start() if $value eq '1';
    return ViewMenu::start('menu_end') if $value eq 'stop';
    return MainMenu::start();
}

=head2 _search_cookbook (レシピ検索の遷移)

    1 -> search food へ
    0 -> main menu へ
    それ以外 -> もう一度 search cookbook を表示

=cut

sub _search_cookbook {
    my $value = shift;
    return SearchFood::start() if $value eq '1';
    return MainMenu::start()   if $value eq '0';
    return SearchCookbook::start();
}

=head2 _search_food (料理名によるレシピ検索の遷移)

    0 -> search cookbook へ
    表示されている数字 -> 該当のメニュー詳細表示 へ
    それ以外 -> もう一度 search food を表示

=cut

sub _search_food {
    my $value = shift;
    return SearchCookbook::start() if $value eq '0';
    return SearchFood::start();
}

1;

__END__
