use strict;
use warnings;
use utf8;

binmode STDOUT, ':encoding(UTF-8)';
binmode STDIN,  ':encoding(UTF-8)';
# binmode STDOUT, ':encoding(cp932)';

=encoding utf8

=head1 NAME (名前)

stdout_from_sum_file_data - ファイルの中の値をすべて合計

=head1 SYNOPSIS（概要）

ファイルから入力した値をすべて合計し、標準出力へ

=cut

# ファイルパスの設定
my $input_file_path = './data_input.csv';

# 出力する文字列を作成
my $sum_value = get_sum_file_date($input_file_path);

# 画面に出力
print '合計 = ' . $sum_value . "\n";

# ファイルから値を入力、すべて合計した後出力する関数
sub get_sum_file_date {
    my $file_path = shift;

    # 接続するためのファイルハンドルの用意
    open my $input_fh, '<:encoding(UTF-8)', $input_file_path
        or die "Can't open '$input_file_path': $!";

    my $sum = 0;

    # ファイルから１行づつ読み込み
    while ( my $line = <$input_fh> ) {
        chomp $line;

        # 「,」で区切って、配列に入れる
        my @numbers = split ',', $line;

        # 配列の値をすべて取り出し、足し合わせ
        for my $number (@numbers) {
            $sum += $number;
        }
    }

    # すべてを合計した値を返却
    return $sum;
}

__END__

コードを書き始める前に、なにをしたいかを整理

1, 読み込みたいファイルを指定
2, ファイルから値を読込、合計した値になったものを取得
3, 画面に出力

結論をイメージして逆算して考えていくと考え方が整理しやすい
