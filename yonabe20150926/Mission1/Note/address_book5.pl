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

=head2 main_menu

    メインメニュー

    >>
    >> * * * main menu * * *
    >> search zipcode address [1]
    >> address book stop [stop]
    >> * * * end * * *
    >> 1

=cut









=head2 search_zipcode_address

    郵便番号検索

    >>
    >> * * * search zipcode address [1] * * *
    >> zipcode? [***-****] or [***]
    >> * * * end * * *
    >> 812-0041
    >>
    >> * * * result search zipcode address [1] * * *
    >> 1 | 8120041 | 福岡県 | 福岡市博多区 | 吉塚 |
    >> * * * end * * *

=cut

sub search_zipcode_address {











}

=head2 get_validate_value

    入力値検証して取得
    郵便番号ではない文字の入力時は拒否
    812-0041 -> 8120041

    >>
    >> * * * search zipcode address [1] * * *
    >> zipcode? [***-****] or [***]
    >> * * * end * * *
    >> fukuoka
    >>
    >> * * * result search zipcode address [1] * * *
    >> none address!
    >> * * * end * * *

=cut

sub get_validate_value {
    my $value = shift;
    if ( $value =~ m{(^\d\d\d$)|(^\d\d\d)(-)(\d\d\d\d$)} ) {
        return $1 if $1;
        return $2 . $4;
    }
    return;
}

=head2 search

    郵便番号からの検索機能
    参照データ zipcode.txt ファイル エンコード utf8

    >> 812-0041
    >>
    >> 1 | 8120041 | 福岡県 | 福岡市博多区 | 吉塚 |

=cut

sub search {
    my $value     = shift;
    my $file_path = shift;

    open my $zipcode_fh, '<:encoding(UTF-8)', $file_path
        or die "Can't open '$file_path': $!";

    my $result = [];
    my $result_number = 0;

    while (my $zipcode_row = <$zipcode_fh>) {
        my @zipcode_rows = split ',', $zipcode_row;
        my $new_zipcode_row = join ' | ', @zipcode_rows;
        if ( $zipcode_rows[0] =~ m{^$value} ) {
            $result_number += 1;
            $new_zipcode_row = '>> ' . $result_number . ' | '. $new_zipcode_row;
            chomp $new_zipcode_row;
            $new_zipcode_row .= ' | ' . "\n";
            push @{$result}, $new_zipcode_row;
        }
    }
    return $result;
}

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

=head2 get_value

    標準入力からの値を取得し改行文字を削除

=cut

sub get_value {
    my $value = <STDIN>;
    chomp $value;
    return $value;
}

=head2 print_msg

    文字列を出力する機能を集約

=cut

sub print_msg {
    my $type = shift;

    return if !$type;













    my $zipcode_address_menu
        = '>> ' . "\n"
        . '>> * * * search zipcode address [1] * * *' . "\n"
        . '>> zipcode? [***] or [***-****]' . "\n"
        . '>> * * * end * * *' . "\n"
        . '>> ';

    my $result_head
        = '>> ' . "\n"
        . '>> * * * result search zipcode address [1] * * *' . "\n";

    my $result_end = '>> * * * end * * *' . "\n";

    my $not_address = '>> none address!' . "\n";

    my $msg_hash = +{


        zipcode_address_menu => $zipcode_address_menu,
        result_head          => $result_head,
        result_end           => $result_end,
        not_address          => $not_address,
    };
    return $msg_hash->{$type} if $type eq 'not_address';
    print $msg_hash->{$type};
    return;
}

__END__
