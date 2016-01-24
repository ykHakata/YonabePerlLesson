use strict;
use warnings;
use utf8;

binmode STDOUT, ':encoding(UTF-8)';
# binmode STDOUT, ':encoding(cp932)';

=encoding utf8

=head1 NAME (名前)

variable - 変数について

=head1 SYNOPSIS（概要）

変数の使用例

=cut

# スカラー
# TODO


# リスト(配列)
# TODO





# ハッシュ
# TODO










__END__

プログラミング、言語、ですので、頭で覚えようとするとなかなかうまくいきません。
イメージしてみます。

例えば

$name = 'nishiru';
(にしるさんという人の名前、一人)

@names = ('nishiru', 'sakamoto', 'saigou', 'ito');
(名前が複数存在することを表現)

%name_data = (
    nishiru  => 'nishiru@gmail.com',
    sakamoto => 'sakamoto@gmail.com',
    saigou   => 'saigou@gmail.com',
    ito      => 'ito@gmail.com',
);
(名前に紐付いているメールアドレスを表現している)

変数につける名前に工夫をするとイメージがしやすくなります。
