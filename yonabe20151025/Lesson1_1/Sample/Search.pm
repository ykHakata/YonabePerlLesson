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

    # TODO 後ほど、テキストファイル読込を記述

    my $food = +{
        title => '>> [1] 余りクッキーパウンドケーキ' . "\n"
            . '>> [2] さつま芋ごはん' . "\n"
            . '>> [3] とろろ昆布と桜海老のお吸い物' . "\n"
            . '>> [4] 白菜チョレギサラダ' . "\n"
            . '>> [5] ニラもやしあんかけ炒め' . "\n",
        numbers => [ 1, 2, 3, 4, 5 ],
        detail  => +{
            food_title => 'タイトルのダミー出力',
            foodstuff  => ['材料のダミー出力'],
            recipe     => ['作り方のダミー出力'],
            point      => 'ポイントのダミー出力',
        },
    };

    # TODO 後ほど、テキストファイルから必要な情報の検索機能を記述

    return $food->{title}   if $type eq 'food' && $value eq 'title';
    return $food->{numbers} if $type eq 'food' && $value eq 'numbers';
    return $food->{detail};
}

1;

__END__
