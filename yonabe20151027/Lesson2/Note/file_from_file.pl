use strict;
use warnings;
use utf8;

binmode STDOUT, ':encoding(UTF-8)';
binmode STDIN,  ':encoding(UTF-8)';

=encoding utf8

=head1 NAME (名前)

file_from_file - ファイルからファイルへ出力

=head1 SYNOPSIS（概要）

ファイルから入力し、ファイルへ出力する

=cut

# ファイルパスの設定
# TODO


# 接続するためのファイルハンドルの用意
# TODO





# ファイルから１行づつ読み込み、出力用のファイルに追記しながら書込み
# TODO





__END__

読み込み側、書込み側ともに、 utf8 で実施する
書込み側のファイルハンドル用意の際 >> になっていることに注意
>> はファイルに追記され、 > は上書きされる
追記や上書きなど用途によって使い分けができる
