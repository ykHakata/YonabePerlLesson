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
    die 'not type!!' if !$type;
    return _search_food() if $type eq 'search_food';
    die 'Menu does not exist!!';
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
