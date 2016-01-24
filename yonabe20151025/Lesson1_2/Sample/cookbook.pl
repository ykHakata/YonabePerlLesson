use strict;
use warnings;
use utf8;
use SearchFood;

binmode STDOUT, ':encoding(UTF-8)';
binmode STDIN,  ':encoding(UTF-8)';

=encoding utf8

=head1 NAME (名前)

cookbook - コマンドラインで使うレシピ検索システム

=cut

SearchFood::start();

__END__
