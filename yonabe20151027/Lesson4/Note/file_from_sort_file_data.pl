use strict;
use warnings;
use utf8;

binmode STDOUT, ':encoding(UTF-8)';
binmode STDIN,  ':encoding(UTF-8)';

=encoding utf8

=head1 NAME (名前)

file_from_sort_file_data - ファイルの中の値を並び替え

=head1 SYNOPSIS（概要）

ファイルから入力した値を条件に応じ並び替え、ファイルへ出力

=cut

# ファイルパスの設定
# TODO


# 並べ替えたいカラム名を決定
# TODO

# 並べ替えるデータの種類, 数字 => 'int', 文字 => 'text'
# TODO


# ファイルデーターのカラム名取得
# TODO

sub get_col_names {
# TODO













}


# カラム名からカラムの列の番号(インデックス)取得
# TODO

sub get_col_index {
# TODO






}


# 並べ替えたい、カラムのデーターとファイルの行番号を取得

# データー構造の例
# my $sort_data = [
#     +{  file_id  => 3,
#         sort_val => '2015-10-09',
#     },
#     +{  file_id  => 4,
#         sort_val => '2015-10-08',
#     },
#     +{...},
# ];

# TODO

sub get_file_id_with_sort_val {
# TODO


















}


# データーの並び替えを実行(最小限のデーター)
# TODO

sub get_sorted_val{
# TODO











}

# 並び替えたデーター順に残りのデーターを一行づつ取得し、一行書き出し
# TODO




# 指定したデータを一行取得
sub search_file_id_val {
# TODO
















}

# 一行づつ指定したファイルに書き出し
sub writing_file_data {
# TODO








}

__END__

実際はこのコードに問題がないわけではありません。
どのくらい問題点が見つけられるでしょうか？

大事なところは、 Excel などの既存のアプリを使うとわりと手軽に
並び替えやデータを入替を行うことができます。

しかし、データが膨大になった場合、動きがとても遅かったり不安定になったり、
そのような問題が発生した場合、 Excel 自体をカスタマイズするのは難しく
そもそも何が原因で動かないのかもよくわかりません。

このサンプルコードの事例では、ファイルのデータをすべて読みこんで並び替えを
行っているのでなく、ファイルの行番号と並び替えたい情報だけを読み込み並び替えを
行っています。

実際に自信でコードを書いてみると Excel というアプリは実によくできているなと
実感をします。

IT 機器に使われるのでなく、自分がやりたいことを明確にして、
上手にパソコンやアプリを選択して活用していきましょう。
