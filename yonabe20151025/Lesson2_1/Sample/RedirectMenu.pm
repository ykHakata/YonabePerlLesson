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
    return _search_cookbook($value) if $type eq 'search_cookbook';
    return _search_food($value)     if $type eq 'search_food';
    die 'Redirec does not exist!!';
}

=head2 _search_cookbook (レシピ検索の遷移)

    1 -> search food へ
    0 -> main menu へ
    それ以外 -> もう一度 search cookbook を表示

=cut

sub _search_cookbook {
    my $value = shift;
    return SearchFood::start() if $value eq '1';
    return;
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
