package Search;
use strict;
use warnings;
use utf8;

binmode STDOUT, ':encoding(UTF-8)';
binmode STDIN,  ':encoding(UTF-8)';

=encoding utf8

=head1 NAME (名前)

Search - 検索機能

=head1 SYNOPSIS (概要)

cookbook アプリの検索に関する機能

=cut

=head2 start

    検索実行

=cut

sub start {
    my $type  = shift;
    my $value = shift;
    die 'not type!! or value!!' if !$type || !defined $value;
    return _food( $type, $value ) if $type eq 'food' && $value eq 'title';
    return _food( $type, $value ) if $type eq 'food' && $value eq 'numbers';
    return _food( $type, $value ) if $type eq 'search_food';
    die 'search does not exist!!';
}

sub _food {
    my $type  = shift;
    my $value = shift;

# TODO
































    return $food->{title}   if $type eq 'food' && $value eq 'title';
    return $food->{numbers} if $type eq 'food' && $value eq 'numbers';
    return $food->{detail};
}

sub _count_up {
# TODO



}

sub _get_title {
# TODO





}

sub _get_numbers {
# TODO


}

sub _get_food_detail {
# TODO







}

sub _get_food_title {
# TODO





}

sub _get_foodstuff {
# TODO





}

sub _get_recipe {
# TODO





}

sub _get_point {
# TODO





}

1;

__END__
