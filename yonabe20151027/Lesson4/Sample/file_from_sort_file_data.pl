use strict;
use warnings;
use utf8;

binmode STDOUT, ':encoding(UTF-8)';
binmode STDIN,  ':encoding(UTF-8)';

=encoding utf8

=head1 NAME (名前)

file_from_sort_file_data - ファイルの中の値を並び替え

=head1 SYNOPSIS（概要）

ファイルから入力した値を条件に応じ並び替え、ファイルへ出力

=cut

# ファイルパスの設定
my $input_file_path  = './1309-T.csv';
my $output_file_path = './output.csv';

# 並べ替えたいカラム名を決定
my $sort_col_name = '売買代金';

# 並べ替えるデータの種類, 数字 => 'int', 文字 => 'text'
my $sort_type = 'int';


# ファイルデーターのカラム名取得
my $col_names = get_col_names($input_file_path);

sub get_col_names {
    my $file_path = shift;

    open my $input_fh, '<:encoding(UTF-8)', $file_path
        or die "Can't open '$file_path': $!";

    my $names = [];
    while (my $line = <$input_fh>) {
        if ( $. eq 2 ) {
            chomp $line;
            @{$names} = split ',', $line;
        }
    }
    close $input_fh;
    return $names;
}


# カラム名からカラムの列の番号(インデックス)取得
my $search_index = get_col_index( $sort_col_name, $col_names );

sub get_col_index {
    my $sort_col_name = shift;
    my $col_names     = shift;

    while ( my ( $index, $val ) = each @{$col_names} ) {
        return $index if $sort_col_name eq $val;
    }
    return;
}


# 並べ替えたい、カラムのデーターとファイルの行番号を取得

# データー構造の例
# my $sort_data = [
#     +{  file_id  => 3,
#         sort_val => '2015-10-09',
#     },
#     +{  file_id  => 4,
#         sort_val => '2015-10-08',
#     },
#     +{...},
# ];

my $sort_data = get_file_id_with_sort_val( $input_file_path, $search_index );

sub get_file_id_with_sort_val {
    my $file_path    = shift;
    my $search_index = shift;

    open my $input_fh, '<:encoding(UTF-8)', $file_path
        or die "Can't open '$file_path': $!";

    my $sort_data = [];

    while ( my $line = <$input_fh> ) {
        next if $. eq 1 || $. eq 2;
        chomp $line;
        my @columns = split ',', $line;
        push @{$sort_data},
            +{  file_id  => $.,
                sort_val => $columns[$search_index],
            };
    }
    close $input_fh;
    return $sort_data;
}


# データーの並び替えを実行(最小限のデーター)
$sort_data = get_sorted_val( $sort_data, $sort_type );

sub get_sorted_val{
    my $sort_data = shift;
    my $sort_type = shift;

    return if !$sort_type;

    return [ sort { $a->{sort_val} cmp $b->{sort_val} } @{$sort_data} ]
        if $sort_type eq 'text';

    return [ sort { $a->{sort_val} <=> $b->{sort_val} } @{$sort_data} ]
        if $sort_type eq 'int';

    return;
}

# 並び替えたデーター順に残りのデーターを一行づつ取得し、一行書き出し
for my $data ( @{$sort_data} ) {
    my $row = search_file_id_val( $input_file_path, $data->{file_id} );
    writing_file_data( $output_file_path, $row );
}

# 指定したデータを一行取得
sub search_file_id_val {
    my $file_path = shift;
    my $file_id   = shift;

    open my $input_fh, '<:encoding(UTF-8)', $file_path
        or die "Can't open '$file_path': $!";

    # 日付順に出力して全部おわったら終了
    while ( my $line = <$input_fh> ) {
        next if $. eq 1 || $. eq 2;
        chomp $line;
        if ( $file_id eq $. ) {
            close $input_fh;
            return $line;
        }
    }
    close $input_fh;
    return;
}

# 一行づつ指定したファイルに書き出し
sub writing_file_data {
    my $file_path = shift;
    my $row       = shift;

    open my $output_fh, '>>:encoding(UTF-8)', $file_path
        or die "Can't open '$file_path': $!";

    print $output_fh $row . "\n";
    close $output_fh;
    return;
}

__END__

実際はこのコードに問題がないわけではありません。
どのくらい問題点が見つけられるでしょうか？

大事なところは、 Excel などの既存のアプリを使うとわりと手軽に
並び替えやデータを入替を行うことができます。

しかし、データが膨大になった場合、動きがとても遅かったり不安定になったり、
そのような問題が発生した場合、 Excel 自体をカスタマイズするのは難しく
そもそも何が原因で動かないのかもよくわかりません。

このサンプルコードの事例では、ファイルのデータをすべて読みこんで並び替えを
行っているのでなく、ファイルの行番号と並び替えたい情報だけを読み込み並び替えを
行っています。

実際に自信でコードを書いてみると Excel というアプリは実によくできているなと
実感をします。

IT 機器に使われるのでなく、自分がやりたいことを明確にして、
上手にパソコンやアプリを選択して活用していきましょう。
