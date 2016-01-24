use strict;
use warnings;
use utf8;

binmode STDOUT, ':encoding(UTF-8)';
# binmode STDOUT, ':encoding(cp932)';

=encoding utf8

=head1 NAME (名前)

reference - リファレンスについて

=head1 SYNOPSIS（概要）

リファレンスの使用例

=cut

# 宣言は $ で行う。

# 配列のリファレンス
my $array_ref = [ 1, 2, 3, 4, 5, 6, 7 ];
for my $i ( @{$array_ref} ) {
    print $i. "\n";
}

# ハッシュのリファレンス
my $hash_ref = +{
    file_path => './input.csv',
    open_type => '<:encoding(UTF-8)',
};

print $hash_ref->{file_path}, "\n";
print $hash_ref->{open_type}, "\n";

__END__

リファレンスは、スカラー変数のリファレンス、サブルーチンのリファレンスも
存在しますが、今回は利用頻度の高いものに絞って紹介しています。

ハッシュのリファレンスを作成する場合 +{} を使っていますが {} でも作成できます。
+{} にしておくと、意味合いの違う裸のブロックと明確に分け事ができ、
視覚的に違いを認識しやすいです。
