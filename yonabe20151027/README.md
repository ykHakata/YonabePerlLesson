# よなべPerl東京 / KANDA LOUNGE 「Excel 脱出計画」[2015-10-27]

よなべPerl WEB サイト

    http://yonabeperl.blog.jp/

主催者ツイッター

    https://twitter.com/hakata_oyuki
    https://twitter.com/nishiru3

関連しているPerl関連の勉強会

    Perl 入学式

    http://www.perl-entrance.org/

覚えておくと便利

    シンタックスをチェック

    $ perl -c cookbook.pl 
    cookbook.pl syntax OK

    SQLite3 の存在確認

    $ which sqlite3
    /usr/bin/sqlite3

## 本日の流れ

    ＜開場＞
    19:00 準備
    ＜開始＞
    19:15 挨拶と本日の概要説明
    19:30 作業開始にあたり最低限度の環境構築
    19:45 チュートリアルを使ったデータ加工の実例を使い実際にプログミングに挑戦
    20:45 終わりの挨拶、片付け
    ＜終了＞
    21:00 退場

## 資料の概要

    yonabe20151025 (Excel 脱出計画)
        Lesson1 (単純な Perl スクリプト)
            Note
            Sample
                print_hello - 標準出力
                stdout_from_stdin - 標準入力から標準出力へ

        Lesson2 (外部ファイルを使用する Perl スクリプト)
            Note
            Sample
                stdout_from_file - ファイルから標準出力へ
                file_from_file - ファイルからファイルへ出力

        Lesson3 (外部ファイルを加工する Perl スクリプト)
            Note
            Sample
                stdout_from_sum_file_data - ファイルの中の値をすべて合計
                variable - 変数について
                reference - リファレンスについて
                subroutine - サブルーチンについて

        Lesson4 (外部ファイルを並び替え Perl スクリプト)
            Note
            Sample
                file_from_sort_file_data - ファイルの中の値を並び替え

        Lesson5 ( SQL を活用したアプローチ)
            Note
            Sample
                stock.db - データーベースのファイル
                stock.csv - データーを新規作成するときに読み込むファイル
                create_table_recipe.sql - テーブルを作成するときに読み込むファイル
                drop_table_recipe.sql - テーブルを削除するときに読み込むファイル
                search_stock.sql - データーを検索するときに読み込むファイル
            document.md - 説明

        README.txt

## memo
