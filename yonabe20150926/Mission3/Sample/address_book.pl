use strict;
use warnings;
use utf8;

binmode STDOUT, ':encoding(UTF-8)';
binmode STDIN,  ':encoding(UTF-8)';

=encoding utf8

=head1 NAME (名前)

address_book - コマンドラインで使う住所録

=head1 SYNOPSIS (概要)

郵便番号から住所を検索するシステム
電話番号から名前を検索するシステム
電話番号から住所録を検索するシステム

=cut

address_book();

=head2 address_book

    アプリケーション全体

=cut

sub address_book {
    start_menu();
    return;
}

=head2 start_menu

    スタートメニュー

    >> address book start? [start/stop]
    >> start

=cut

sub start_menu {
    print_msg('start_head');
    my $value = get_value();
    return main_menu() if $value eq 'start';
    return print_msg('start_end') if $value eq 'stop';
    return start_menu();
}

=head2 main_menu

    メインメニュー

    >>
    >> * * * main menu * * *
    >> search zipcode address [1]
    >> search tel name us [2]
    >> search tel address and name us [3]
    >> create dummy address [4]
    >> address book stop [stop]
    >> * * * end * * *
    >> 1

=cut

sub main_menu {
    print_msg('main_menu');
    my $value = get_value();
    return search_zipcode_address()         if $value eq '1';
    return search_tel_name_us()             if $value eq '2';
    return search_tel_address_and_name_us() if $value eq '3';
    return create_dummy_address_menu()      if $value eq '4';
    return print_msg('start_end')           if $value eq 'stop';
    return main_menu();
}

=head2 search_zipcode_address

    郵便番号検索

    >>
    >> * * * search zipcode address [1] * * *
    >> zipcode? [***-****] or [***]
    >> * * * end * * *
    >> 812-0041
    >>
    >> * * * result search zipcode address [1] * * *
    >> 1 | 8120041 | 福岡県 | 福岡市博多区 | 吉塚 |
    >> * * * end * * *

=cut

sub search_zipcode_address {
    print_msg('zipcode_address_menu');
    my $value = get_value();
    $value = get_validate_value($value);
    return view_result(), main_menu() if !$value;
    my $result = search( $value, './zipcode.txt' );
    return view_result($result), main_menu();
}

=head2 search_tel_name_us

    電話番号検索

    >>
    >> * * * search tel name us [2] * * *
    >> tel? [***-****-****]
    >> * * * end * * *
    >> 080-9300-8793
    >>
    >> * * * result search tel name us [2] * * *
    >> 1 | 片瀬 進 | かたせ すすむ | 080-9300-8793 |
    >> * * * end * * *

=cut

sub search_tel_name_us {
    print_msg('tel_name_us_menu');
    my $value = get_value();
    $value = get_validate_value( $value, 'tel' );
    return view_result( $value, 'tel' ), main_menu() if !$value;
    my $result = search( $value, './tellist.txt', 'tel' );
    return view_result( $result, 'tel' ), main_menu();
}

=head2 search_tel_address_and_name_us

    電話番号から住所録検索

    >>
    >> * * * search tel address and name us [3] * * *
    >> tel? [***-****-****]
    >> * * * end * * *
    >> 080-9300-8793
    >>
    >> * * * result search tel address and name us [3] * * *
    >> 1 | 080-9300-8793 | 片瀬 進 | かたせ すすむ | 8010811 | 福岡県 | 北九州市門司区 | 大積 |
    >> * * * end * * *

=cut

sub search_tel_address_and_name_us {
    print_msg('tel_address_and_name_us_menu');
    my $value = get_value();
    $value = get_validate_value( $value, 'tel_address' );
    return view_result( $value, 'tel_address' ), main_menu() if !$value;
    my $result = search( $value, './addresslist.txt', 'tel_address' );
    return view_result( $result, 'tel_address' ), main_menu();
}

=head2 create_dummy_address_menu

    架空の個人情報を作成

    >>
    >> * * * create dummy address [4] * * *
    >> address count? [1-10]
    >> * * * end * * *
    >> 5
    >>
    >> * * * result create dummy address [4] * * *
    >> 1 | 090-0097-6804 | 榎本 璃子 | えのもと りこ | 8010876 | 福岡県 | 北九州市門司区 | 花月園 | 
    >> 2 | 090-0264-5861 | 原 樹里 | はら じゅり | 8360076 | 福岡県 | 大牟田市 | 三里町 | 
    >> 3 | 080-6986-6793 | 小口 雄太 | おぐち ゆうた | 8090035 | 福岡県 | 中間市 | 松ケ岡 | 
    >> 4 | 090-6643-1348 | 岡崎 良介 | おかざき りょうすけ | 8380111 | 福岡県 | 小郡市 | 吹上 | 
    >> 5 | 080-4674-7025 | 役所 亜希 | やくしょ あき | 8201103 | 福岡県 | 鞍手郡小竹町 | 勝野 | 
    >> * * * end * * *

=cut

sub create_dummy_address_menu {
    print_msg('create_dummy_address_menu');
    my $value = get_value();
    $value = get_validate_value( $value, 'create_dummy' );
    return view_result( $value, 'create_dummy' ), main_menu() if !$value;
    my $result
        = create_dummy( $value, './zipcode.txt', './namelist.txt' );
    return view_result( $result, 'create_dummy' ), main_menu();
}

=head2 get_validate_value

    入力値検証して取得

    get_validate_value($value, 'zipcode')
    get_validate_value($value)
    get_validate_value_zipcode に引き渡し

    get_validate_value($value, 'tel')
    get_validate_value_tel に引き渡し

    get_validate_value($value, 'tel_address')
    get_validate_value_tel に引き渡し

    get_validate_value($value, 'create_dummy')
    get_validate_value_create_dummy に引き渡し

=cut

sub get_validate_value {
    my $value = shift;
    my $type  = shift;
    return get_validate_value_zipcode($value)
        if !$type || ( $type eq 'zipcode' );
    return get_validate_value_tel($value) if $type eq 'tel';
    return get_validate_value_tel($value) if $type eq 'tel_address';
    return get_validate_value_create_dummy($value) if $type eq 'create_dummy';
    return;
}

=head2 get_validate_value_zipcode

    入力値検証して取得
    郵便番号ではない文字の入力時は拒否
    812-0041 -> 8120041

    >>
    >> * * * search zipcode address [1] * * *
    >> zipcode? [***-****] or [***]
    >> * * * end * * *
    >> fukuoka
    >>
    >> * * * result search zipcode address [1] * * *
    >> none address!
    >> * * * end * * *

=cut

sub get_validate_value_zipcode {
    my $value = shift;
    if ( $value =~ m{(^\d\d\d$)|(^\d\d\d)(-)(\d\d\d\d$)} ) {
        return $1 if $1;
        return $2 . $4;
    }
    return;
}

=head2 get_validate_value_tel

    入力値検証して取得
    指定の電話番号ではない文字の入力時は拒否
    080-9300-8793 形式のみを許可

    >>
    >> * * * search tel name us [2] * * *
    >> tel? [***-****-****]
    >> * * * end * * *
    >> fukuoka
    >>
    >> * * * result search tel name us [2] * * *
    >> none name us!
    >> * * * end * * *

=cut

sub get_validate_value_tel {
    my $value = shift;
    if ( $value =~ m{(^\d\d\d-\d\d\d\d-\d\d\d\d$)} ) {
        return $1 if $1;
    }
    return;
}

=head2 get_validate_value_create_dummy

    入力値検証して取得
    1 から 10 までの数字のみを許可

    >>
    >> * * * create dummy address [4] * * *
    >> address count? [1-10]
    >> * * * end * * *
    >> 20
    >>
    >> * * * result create dummy address [4] * * *
    >> not count 1 - 10 only!
    >> * * * end * * *

=cut

sub get_validate_value_create_dummy {
    my $value = shift;
    if ( $value =~ m{(^[1-9]$|^[1][0]$)} ) {
        return $1 if $1;
    }
    return;
}

=head2 search

    検索機能

    search( $value, './zipcode.txt' )
    search( $value, './zipcode.txt', 'zipcode' )
    search_zipcode に引き渡し

    search( $value, './telist.txt', 'tel' )
    search_tel に引き渡し

    search( $value, './addresslist.txt', 'tel_address' )
    search_tel_address に引き渡し

=cut

sub search {
    my $value     = shift;
    my $file_path = shift;
    my $type      = shift;

    return search_zipcode( $value, $file_path )
        if !$type || ( $type eq 'zipcode' );

    return search_tel( $value, $file_path )
        if ( $type && ( $type eq 'tel' ) );

    return search_tel_address( $value, $file_path )
        if ( $type && ( $type eq 'tel_address' ) );

    return;
}

=head2 search_zipcode

    郵便番号からの検索機能
    参照データ zipcode.txt ファイル エンコード utf8

    >> 812-0041
    >>
    >> 1 | 8120041 | 福岡県 | 福岡市博多区 | 吉塚 |

=cut

sub search_zipcode {
    my $value     = shift;
    my $file_path = shift;

    open my $zipcode_fh, '<:encoding(UTF-8)', $file_path
        or die "Can't open '$file_path': $!";

    my $result        = [];
    my $result_number = 0;

    while ( my $zipcode_row = <$zipcode_fh> ) {
        my @zipcode_rows = split ',', $zipcode_row;
        my $new_zipcode_row = join ' | ', @zipcode_rows;
        if ( $zipcode_rows[0] =~ m{^$value} ) {
            $result_number += 1;
            $new_zipcode_row
                = '>> ' . $result_number . ' | ' . $new_zipcode_row;
            chomp $new_zipcode_row;
            $new_zipcode_row .= ' | ' . "\n";
            push @{$result}, $new_zipcode_row;
        }
    }
    return $result;
}

=head2 search_tel

    電話番号からの検索機能
    参照データ tellist.txt ファイル エンコード utf8

    >> 080-9300-8793
    >>
    >> 1 | 片瀬 進 | かたせ すすむ | 080-9300-8793 |

=cut

sub search_tel {
    my $value     = shift;
    my $file_path = shift;

    open my $tellist_fh, '<:encoding(UTF-8)', $file_path
        or die "Can't open '$file_path': $!";

    my $result        = [];
    my $result_number = 0;

    while ( my $tellist_row = <$tellist_fh> ) {
        my @tellist_rows = split ',', $tellist_row;
        my $new_tellist_row = join ' | ', @tellist_rows;
        if ( $tellist_rows[2] =~ m{^$value} ) {
            $result_number += 1;
            $new_tellist_row
                = '>> ' . $result_number . ' | ' . $new_tellist_row;
            chomp $new_tellist_row;
            $new_tellist_row .= ' | ' . "\n";
            push @{$result}, $new_tellist_row;
        }
    }
    return $result;
}

=head2 search_tel_address

    電話番号からの住所録検索機能
    参照データ addresslist.txt ファイル エンコード utf8

    >> 080-9300-8793
    >>
    >> 1 | 080-9300-8793 | 片瀬 進 | かたせ すすむ | 8010811 | 福岡県 | 北九州市門司区 | 大積 |

=cut

sub search_tel_address {
    my $value     = shift;
    my $file_path = shift;

    open my $address_list_fh, '<:encoding(UTF-8)', $file_path
        or die "Can't open '$file_path': $!";

    my $result        = [];
    my $result_number = 0;

    while ( my $address_list_row = <$address_list_fh> ) {
        my @address_list_rows = split ',', $address_list_row;
        my $new_address_list_row = join ' | ', @address_list_rows;
        if ( $address_list_rows[0] =~ m{^$value} ) {
            $result_number += 1;
            $new_address_list_row
                = '>> ' . $result_number . ' | ' . $new_address_list_row;
            chomp $new_address_list_row;
            $new_address_list_row .= ' | ' . "\n";
            push @{$result}, $new_address_list_row;
        }
    }
    return $result;
}

=head2 create_dummy

    架空の個人情報を指定の数だけ作成
    参照データ zipcode.txt ファイル エンコード utf8
    参照データ namelist.txt ファイル エンコード utf8

    >> 5
    >> 
    >> * * * result create dummy address [4] * * *
    >> 1 | 090-0097-6804 | 榎本 璃子 | えのもと りこ | 8010876 | 福岡県 | 北九州市門司区 | 花月園 | 
    >> 2 | 090-0264-5861 | 原 樹里 | はら じゅり | 8360076 | 福岡県 | 大牟田市 | 三里町 | 
    >> 3 | 080-6986-6793 | 小口 雄太 | おぐち ゆうた | 8090035 | 福岡県 | 中間市 | 松ケ岡 | 
    >> 4 | 090-6643-1348 | 岡崎 良介 | おかざき りょうすけ | 8380111 | 福岡県 | 小郡市 | 吹上 | 
    >> 5 | 080-4674-7025 | 役所 亜希 | やくしょ あき | 8201103 | 福岡県 | 鞍手郡小竹町 | 勝野 | 
    >> * * * end * * *

=cut

sub create_dummy {
    my $end_count         = shift;
    my $file_path_zipcode = shift;
    my $file_path_name    = shift;

    # ファイルの件数を求める
    my $zipcode_count = get_count_file_row($file_path_zipcode);
    my $name_count    = get_count_file_row($file_path_name);

    # 欲しい行数を求める
    my $zipcode_rows = get_search_rows( $zipcode_count, $end_count );
    my $name_rows    = get_search_rows( $name_count,    $end_count );

    @{$zipcode_rows} = sort { $a <=> $b } @{$zipcode_rows};
    @{$name_rows}    = sort { $a <=> $b } @{$name_rows};

    my $dummy_address
        = get_dummy_data( 'zipcode', $zipcode_rows, $file_path_zipcode );
    my $dummy_name = get_dummy_data( 'name', $name_rows, $file_path_name );
    my $dummy_tel = get_dummy_data_tel($end_count);

    my $result = [];
    for my $row ( 1 .. $end_count ) {
        my $dummy_row = '';
        $dummy_row .= shift @{$dummy_tel};
        $dummy_row .= shift @{$dummy_name};
        $dummy_row .= shift @{$dummy_address};

        push $result, $dummy_row;
    }
    return $result;
}

=head2 get_count_file_row

    読み込むファイルの全行数を取得

=cut

sub get_count_file_row {
    my $file_path = shift;
    open my $fh, '<:encoding(UTF-8)', $file_path
        or die "Can't open '$file_path': $!";
    my $count = 0;
    while ( my $row = <$fh> ) {
        $count = $.;
    }
    return $count;
}

=head2 get_search_rows

    ファイルから取得可能な行番号を不規則に作成

=cut

sub get_search_rows {
    my $file_count   = shift;
    my $search_count = shift;
    my $search_rows  = [];

    for my $count ( 1 .. $search_count ) {
        my $row_count = int rand $file_count;
        $row_count -= 1;
        push @{$search_rows}, $row_count;
    }
    return $search_rows;
}

=head2 get_dummy_data

    ファイルからダミー用のデーターを取得

=cut

sub get_dummy_data {
    my $type         = shift;
    my $rows_numbers = shift;
    my $file_path    = shift;

    my $result = [];

    open my $fh, '<:encoding(UTF-8)', $file_path
        or die "Can't open '$file_path': $!";

    while ( my $list_row = <$fh> ) {
        my $fh_number = $.;
        for my $row_number ( @{$rows_numbers} ) {
            if ( $fh_number eq $row_number ) {
                shift @{$rows_numbers};
                my @list_rows = split ',', $list_row;
                my $new_list_row = join ' | ', @list_rows;
                chomp $new_list_row;
                $new_list_row .= ' | ';
                if ($type eq 'zipcode') {
                    $new_list_row .= "\n";
                }
                push @{$result}, $new_list_row;
            }
        }
    }
    return $result;
}

=head2 get_dummy_data_tel

    ダミー用の携帯電話番号を取得

=cut

sub get_dummy_data_tel {
    my $end_count = shift;
    my $dummy_tel = [];
    for my $count ( 1 .. $end_count ) {
        my $top    = create_tel_number('top');
        my $middle = create_tel_number('middle');
        my $under  = create_tel_number('under');
        my $list   = '>> ' . $count . ' | ';
        $list .= $top . '-' . $middle . '-' . $under . ' | ';
        push @{$dummy_tel}, $list;
    }
    return $dummy_tel;
}

=head2 create_tel_number

    ダミー用の携帯電話番号用の数字を不規則に作成

=cut

sub create_tel_number {
    my $type = shift;
    return if !$type;
    my $number = '';
    if ( $type eq 'top' ) {
        $number = '080';
        my $rand_number = int rand 2;
        if ( $rand_number eq 1 ) {
            $number = '090';
        }
    }

    if ( $type eq 'middle' || $type eq 'under' ) {
        for my $count ( 1 .. 4 ) {
            my $rand_number = int rand 10;
            $number .= $rand_number;
        }
    }
    return $number;
}

=head2 view_result

    結果表示画面

    view_result($result)
    view_result( $result, 'zipcode' )
    view_result_zipcode に引き渡し

    view_result( $result, 'tel' )
    view_result_tel に引き渡し

    view_result( $result, 'tel_address' )
    view_result_tel_address に引き渡し

    view_result( $result, 'create_dummy' )
    view_result_create_dummy に引き渡し

=cut

sub view_result {
    my $result = shift;
    my $type   = shift;
    return view_result_zipcode($result)
        if !$type || ( $type eq 'zipcode' );
    return view_result_tel($result) if $type eq 'tel';
    return view_result_tel_address($result) if $type eq 'tel_address';
    return view_result_create_dummy($result) if $type eq 'create_dummy';
    return;
}

=head2 view_result_zipcode

    結果表示画面

    >>
    >> * * * result search zipcode address [1] * * *
    >> 1 | 8120041 | 福岡県 | 福岡市博多区 | 吉塚 |
    >> * * * end * * *

=cut

sub view_result_zipcode {
    my $result = shift;
    print_msg('result_head');
    if ( !$result || !scalar @{$result} ) {
        push @{$result}, print_msg('not_address');
    }
    for my $result_row ( @{$result} ) {
        print $result_row;
    }
    print_msg('result_end');
    return;
}

=head2 view_result_tel

    結果表示画面

    >>
    >> * * * result search tel name us [2] * * *
    >> 1 | 片瀬 進 | かたせ すすむ | 080-9300-8793 |
    >> * * * end * * *

=cut

sub view_result_tel {
    my $result = shift;
    print_msg('result_head_tell');
    if ( !$result || !scalar @{$result} ) {
        push @{$result}, print_msg('not_tell');
    }
    for my $result_row ( @{$result} ) {
        print $result_row;
    }
    print_msg('result_end');
    return;
}

=head2 view_result_tel_address

    結果表示画面

    >>
    >> * * * result search tel address and name us [3] * * *
    >> 1 | 080-9300-8793 | 片瀬 進 | かたせ すすむ | 8010811 | 福岡県 | 北九州市門司区 | 大積 |
    >> * * * end * * *

=cut

sub view_result_tel_address {
    my $result = shift;
    print_msg('result_head_tell_address');
    if ( !$result || !scalar @{$result} ) {
        push @{$result}, print_msg('not_tell_address');
    }
    for my $result_row ( @{$result} ) {
        print $result_row;
    }
    print_msg('result_end');
    return;
}

=head2 view_result_create_dummy

    結果表示画面

    >>
    >> * * * result create dummy address [4] * * *
    >> 1 | 090-0097-6804 | 榎本 璃子 | えのもと りこ | 8010876 | 福岡県 | 北九州市門司区 | 花月園 | 
    >> 2 | 090-0264-5861 | 原 樹里 | はら じゅり | 8360076 | 福岡県 | 大牟田市 | 三里町 | 
    >> 3 | 080-6986-6793 | 小口 雄太 | おぐち ゆうた | 8090035 | 福岡県 | 中間市 | 松ケ岡 | 
    >> 4 | 090-6643-1348 | 岡崎 良介 | おかざき りょうすけ | 8380111 | 福岡県 | 小郡市 | 吹上 | 
    >> 5 | 080-4674-7025 | 役所 亜希 | やくしょ あき | 8201103 | 福岡県 | 鞍手郡小竹町 | 勝野 | 
    >> * * * end * * *

=cut

sub view_result_create_dummy {
    my $result = shift;
    print_msg('result_head_create_dummy');
    if ( !$result || !scalar @{$result} ) {
        push @{$result}, print_msg('not_create_dummy');
    }
    for my $result_row ( @{$result} ) {
        print $result_row;
    }
    print_msg('result_end');
    return;
}

=head2 get_value

    標準入力からの値を取得し改行文字を削除

=cut

sub get_value {
    my $value = <STDIN>;
    chomp $value;
    return $value;
}

=head2 print_msg

    文字列を出力する機能を集約

=cut

sub print_msg {
    my $type = shift;

    return if !$type;

    my $start_head = '>> address book start? [start/stop]' . "\n" . '>> ';

    my $start_end = '>> ' . "\n" . '>> thank you bye!!' . "\n";

    my $main_menu
        = '>>' . "\n"
        . '>> * * * main menu * * *' . "\n"
        . '>> search zipcode address [1]' . "\n"
        . '>> search tel name us [2]' . "\n"
        . '>> search tel address and name us [3]' . "\n"
        . '>> create dummy address [4]' . "\n"
        . '>> address book stop [stop]' . "\n"
        . '>> * * * end * * *' . "\n" . '>> ';

    my $zipcode_address_menu
        = '>> ' . "\n"
        . '>> * * * search zipcode address [1] * * *' . "\n"
        . '>> zipcode? [***] or [***-****]' . "\n"
        . '>> * * * end * * *' . "\n" . '>> ';

    my $tel_name_us_menu
        = '>> ' . "\n"
        . '>> * * * search tel name us [2] * * *' . "\n"
        . '>> tel? [***-****-****]' . "\n"
        . '>> * * * end * * *' . "\n" . '>> ';

    my $tel_address_and_name_us_menu
        = '>> ' . "\n"
        . '>> * * * search tel address and name us [3] * * *' . "\n"
        . '>> tel? [***-****-****]' . "\n"
        . '>> * * * end * * *' . "\n" . '>> ';

    my $create_dummy_address_menu
        = '>> ' . "\n"
        . '>> * * * create dummy address [4] * * *' . "\n"
        . '>> address count? [1-10]' . "\n"
        . '>> * * * end * * *' . "\n" . '>> ';

    my $result_head
        = '>> ' . "\n"
        . '>> * * * result search zipcode address [1] * * *' . "\n";

    my $result_head_tell
        = '>> ' . "\n"
        . '>> * * * result search tel name us [2] * * *' . "\n";

    my $result_head_tell_address
        = '>> ' . "\n"
        . '>> * * * result search tel address and name us [3] * * *' . "\n";

    my $result_head_create_dummy
        = '>> ' . "\n"
        . '>> * * * result create dummy address [4] * * *' . "\n";

    my $result_end = '>> * * * end * * *' . "\n";

    my $not_address      = '>> none address!' . "\n";
    my $not_tell         = '>> none name us!' . "\n";
    my $not_tell_address = '>> none address and name us!' . "\n";
    my $not_create_dummy = '>> not count 1 - 10 only!' . "\n";

    my $msg_hash = +{
        start_head                   => $start_head,
        start_end                    => $start_end,
        main_menu                    => $main_menu,
        zipcode_address_menu         => $zipcode_address_menu,
        tel_name_us_menu             => $tel_name_us_menu,
        tel_address_and_name_us_menu => $tel_address_and_name_us_menu,
        create_dummy_address_menu    => $create_dummy_address_menu,
        result_head                  => $result_head,
        result_head_tell             => $result_head_tell,
        result_head_tell_address     => $result_head_tell_address,
        result_head_create_dummy     => $result_head_create_dummy,
        result_end                   => $result_end,
        not_address                  => $not_address,
        not_tell                     => $not_tell,
        not_tell_address             => $not_tell_address,
        not_create_dummy             => $not_create_dummy,
    };
    return $msg_hash->{$type}
        if $type eq 'not_address'
        || $type eq 'not_tell'
        || $type eq 'not_tell_address'
        || $type eq 'not_create_dummy';
    print $msg_hash->{$type};
    return;
}

__END__
