package Cookbook;
use strict;
use warnings;
use utf8;
# TODO

binmode STDOUT, ':encoding(UTF-8)';
binmode STDIN,  ':encoding(UTF-8)';

=encoding utf8

=head1 NAME (名前)

Cookbook - レシピ検索システム

=head1 SYNOPSIS (概要)

アプリケーション全体

=cut

=head2 startup

    アプリケーション全体を起動

=cut

sub startup {
# TODO

}

1;

__END__

=head1 SEE ALSO (参照)

全体的な構成

    * cookbook (アプリケーション全体スタート)
        * start_menu (スタートメニュー)
            * main_menu (メインメニュー)
                * search_cookbook (レシピ検索)
                    * search_food (料理名によるレシピ検索)

個別の構成

    * cookbook (アプリケーション全体)

=cut
