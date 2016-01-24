use strict;
use warnings;
use utf8;

binmode STDOUT, ':encoding(UTF-8)';
# binmode STDOUT, ':encoding(cp932)';

=encoding utf8

=head1 NAME (名前)

print_hello - 標準出力

=head1 SYNOPSIS（概要）

標準出力する

=cut

# ここからプログラム開始
print "Hello, World!!\n";

__END__

Windows に関しては標準出力(コマンドプロンプト)が
文字コード cp932 を指定しないとうまく表示できない

テキストエディッタで Perl ソースコードを作成する場合
特別な事情がなければ文字コードは utf8 改行コードは LF にしておく
