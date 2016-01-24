use strict;
use warnings;
use utf8;

binmode STDOUT, ':encoding(UTF-8)';
binmode STDIN,  ':encoding(UTF-8)';

=encoding utf8

=head1 NAME (名前)

address_book - コマンドラインで使う住所録

=head1 SYNOPSIS (概要)

郵便番号から住所を検索するシステム

=cut

address_book();

=head2 address_book

    アプリケーション全体

=cut

sub address_book {






}

=head2 search

    郵便番号からの検索機能
    参照データ zipcode.txt ファイル エンコード utf8

    >> 812-0041
    >>
    >> 1 | 8120041 | 福岡県 | 福岡市博多区 | 吉塚 |

=cut

























=head2 view_result

    結果表示画面

    >>
    >> * * * result search zipcode address [1] * * *
    >> 1 | 8120041 | 福岡県 | 福岡市博多区 | 吉塚 |
    >> * * * end * * *

=cut

sub view_result {
    my $result = shift;
    print_msg('result_head');
    if ( !$result || !scalar @{$result} ) {
        push @{$result}, print_msg('not_address');
    }
    for my $result_row ( @{$result} ) {
        print $result_row;
    }
    print_msg('result_end');
    return;
}

=head2 print_msg

    文字列を出力する機能を集約

=cut

sub print_msg {
    my $type = shift;

    return if !$type;

    my $result_head
        = '>> ' . "\n"
        . '>> * * * result search zipcode address [1] * * *' . "\n";

    my $result_end = '>> * * * end * * *' . "\n";

    my $not_address = '>> none address!' . "\n";

    my $msg_hash = +{
        result_head          => $result_head,
        result_end           => $result_end,
        not_address          => $not_address,
    };
    return $msg_hash->{$type} if $type eq 'not_address';
    print $msg_hash->{$type};
    return;
}

__END__
