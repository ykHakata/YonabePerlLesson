package GetValidateValue;
use strict;
use warnings;
use utf8;

binmode STDOUT, ':encoding(UTF-8)';
binmode STDIN,  ':encoding(UTF-8)';

=encoding utf8

=head1 NAME (名前)

GetValidateValue - 入力値の評価

=head1 SYNOPSIS (概要)

cookbook アプリの各メニューからの入力値の評価

=cut

=head2 start

    入力値取得から値検証をして再度取得

=cut

sub start {
    my $type = shift;
    die 'not type!!' if !$type;
    my $value = <STDIN>;
    chomp $value;
# TODO
    return _search_cookbook($value) if $type eq 'search_cookbook';
    return _search_food($value)     if $type eq 'search_food';
    die 'GetValidateValue does not exist!!';
}

=head2 _main_menu (メインメニュ)

=cut

sub _main_menu {
# TODO



}

=head2 _search_cookbook (レシピ検索)

=cut

sub _search_cookbook {
    my $value = shift;
    return $value if $value eq '1';
    return $value if $value eq '2';
    return $value if $value eq '0';
    return '';
}

=head2 _search_food (料理名によるレシピ検索)

=cut

sub _search_food {
    my $value = shift;

    # メニューに存在する番号のみ
    my $food_title_numbers = Search::start( 'food', 'numbers' );
    for my $food_title_number ( @{$food_title_numbers} ) {
        return $value if $food_title_number eq $value;
    }
    return '';
}

1;

__END__
