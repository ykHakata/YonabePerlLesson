use strict;
use warnings;
use utf8;

binmode STDOUT, ':encoding(UTF-8)';
binmode STDIN,  ':encoding(UTF-8)';
# binmode STDOUT, ':encoding(cp932)';
# binmode STDIN,  ':encoding(cp932)';

=encoding utf8

=head1 NAME (名前)

stdout_from_stdin - 標準入力から標準出力へ

=head1 SYNOPSIS (概要)

標準入力したものを標準出力する

=cut

# 標準入力をうながすための出力
print '>>> ';

# 標準入力からの読み込み
my $input = <STDIN>;

# 改行を除く
chomp $input;

# 標準入力をそのまま出力
print '>>> ' . $input . "\n";

__END__

シングルクォーツ '' とダブルクォーツ "" の違いに注意
"" のなかの特殊な文字(変数など)は展開されて出力
'' のなかの文字はすべて、そのままの状態で出力

STDIN とは最初から用意されているファイルハンドル
裸のワードは関数名と区別がつきにくくなるため、いったん
$input という変数に格納して利用する
