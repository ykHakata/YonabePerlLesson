use strict;
use warnings;
use utf8;
# TODO

binmode STDOUT, ':encoding(UTF-8)';
binmode STDIN,  ':encoding(UTF-8)';

=encoding utf8

=head1 NAME (名前)

cookbook - コマンドラインで使うレシピ検索システム

=cut

# TODO

__END__

=head1 USAGE (使用法)

    $ perl cookbook.pl

    >> cookbook start? [start/stop]
    >> stop
    >>
    >> thank you bye!!

    $ perl cookbook.pl

    >> cookbook start? [start/stop]
    >> start
    >>
    >> * * * main menu * * *
    >> [1] search cookbook
    >> [stop] cookbook stop
    >> * * * end * * *
    >> 1
    >>
    >> * * * search cookbook * * *
    >> [1] search food
    >> [0] main menu
    >> * * * end * * *
    >> 1
    >>
    >> * * * search food * * *
    >> [1] 余りクッキーパウンドケーキ
    >> [2] さつま芋ごはん
    >> [3] とろろ昆布と桜海老のお吸い物
    >> [4] 白菜チョレギサラダ
    >> [5] ニラもやしあんかけ炒め
    >> [0] search cookbook
    >> * * * end * * *
    >> 1
    >>
    >> * * * 余りクッキーパウンドケーキ * * *
    >>
    >> * * 材料 * *
    >> クッキー 200g
    >> 小麦粉 100g

    ....
    ....

    >>
    >> * * * end * * *
    >>
    >> * * * search food * * *
    >> [1] 余りクッキーパウンドケーキ
    >> [2] さつま芋ごはん
    >> [3] とろろ昆布と桜海老のお吸い物
    >> [4] 白菜チョレギサラダ
    >> [5] ニラもやしあんかけ炒め
    >> [0] search cookbook
    >> * * * end * * *
    >> 0
    >>
    >> * * * search cookbook * * *
    >> [1] search food
    >> [0] main menu
    >> * * * end * * *
    >> 0
    >>
    >> * * * main menu * * *
    >> [1] search cookbook
    >> [stop] cookbook stop
    >> * * * end * * *
    >> stop
    >>
    >> thank you bye!!

=cut
