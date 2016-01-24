use strict;
use warnings;
use utf8;

binmode STDOUT, ':encoding(UTF-8)';
# binmode STDOUT, ':encoding(cp932)';

=encoding utf8

=head1 NAME (名前)

subroutine - サブルーチンについて

=head1 SYNOPSIS（概要）

サブルーチンの使用例

=cut

# 足し算を実行する
my $add_value = get_value_add( 1, 2 );

# かけ算を実行する
my $multiply_value = get_value_multiply( 100000, 10000 );

# 求めた値を出力する
print $add_value, "\n";

# 求めた値を出力する
print $multiply_value , "\n";

# 足し算のサブルーチン(関数)
sub get_value_add {
    my ( $left_val, $right_val ) = @_;
    my $num = $left_val + $right_val;
    return $num;
}

# かけ算のサブルーチン(関数)
sub get_value_multiply {
    my ( $left_val, $right_val ) = @_;
    my $num = $left_val * $right_val;
    return $num;
}

__END__

サブルーチンの使い所は一行では書き表せない場合に
一行にまとめて実行させたい場合に役に立ちます。

プログラムは基本的に上から順番に読んで実行されますが、
サブルーチンは上でも下でも記述ができます、
ある程度まとめて書いておいたほうが見易さという点では良いでしょう。

入っていく値、引数、出ていく値、戻り値をしっかり意識するとうまく表現できます。

結論から考えるトレーニングをするとよい頭の体操になります。

名前をつける場合は get_ ... など、動詞を含めるとイメージがしやすいです。
