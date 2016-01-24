use strict;
use warnings;
use utf8;

binmode STDOUT, ':encoding(UTF-8)';
binmode STDIN,  ':encoding(UTF-8)';
# binmode STDOUT, ':encoding(cp932)';

=encoding utf8

=head1 NAME (名前)

stdout_from_file - ファイルから標準出力へ

=head1 SYNOPSIS（概要）

ファイルから入力し、標準出力する

=cut

my $file_path = './data_input.csv';

# ファイルのオープン
open my $fh, '<:encoding(UTF-8)', $file_path
    or die "Can't open '$file_path': $!";

# ファイルから１行づつ読み込みながら出力
while ( my $line = <$fh> ) {
    chomp $line;
    print $line . "\n";
}

__END__

読み込むテキストファイルは utf8 であるため、Windows でも読み込みは
utf8 で良いが出力は画面になるので、 cp932 にする必要がある。

UNIX の世界(Linux や Mac)では基本 文字コードは utf8 であるが、
Windows に関しては今でもデフォルトは utf8 になっていないため、
文字コードについての見識が明るくない場合、
プログラミングをする場合は Mac を使うのが無難な選択肢である。
