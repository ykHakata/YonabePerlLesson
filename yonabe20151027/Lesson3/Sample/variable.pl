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
my $scalar = 1.0;
print "スカラー >>> $scalar" . "\n";

# リスト(配列)
my @array = ( 1 .. 10 );
print 'リスト' . "\n";
for my $int (@array) {
    print "$int\n";
}

# ハッシュ
my %hash = (
    id   => 1,
    name => 'nishiru',
);

print 'ハッシュ' . "\n";

for my $key ( keys %hash ) {
    print ' key >>> ' . "$key," . ' value >>> ' . "$hash{$key}" . "\n";
}

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
