package ViewResult;
use strict;
use warnings;
use utf8;

binmode STDOUT, ':encoding(UTF-8)';
binmode STDIN,  ':encoding(UTF-8)';

=encoding utf8

=head1 NAME (名前)

ViewResult - 検索結果表示

=head1 SYNOPSIS (概要)

cookbook アプリの検索結果を表示する機能

=cut

=head2 start

    結果表示画面

=cut

sub start {
    my $type  = shift;
    my $value = shift;
    die 'not type!!' if !$type;
    return _search_food($value) if $type eq 'search_food';
    die 'Result does not exist!!';
}

sub _search_food {
    my $value = shift;
    _food_title( $value->{food_title} );
    _foodstuff( $value->{foodstuff} );
    _recipe( $value->{recipe} );
    _point( $value->{point} );
    return;
}

sub _food_title {
    my $value = shift;
    my $msg
        = '>> ' . "\n"
        . '>> * * * ' . $value . ' * * *' . "\n";
    print $msg;
    return;
}

sub _foodstuff {
    my $value = shift;
    my $msg
        = '>> ' . "\n"
        . '>> * * 材料 * *' . "\n";
    for my $foodstuff ( @{$value} ) {
        $msg .= '>> ' . $foodstuff . "\n";
    }
    print $msg;
    return;
}

sub _recipe {
    my $value = shift;
    my $msg
        = '>> ' . "\n"
        . '>> * * 作り方 * *' . "\n";
    for my $recipe ( @{$value} ) {
        $msg .= '>> ' . $recipe . "\n";
    }
    print $msg;
    return;
}

sub _point {
    my $value = shift;
    my $msg
        = '>> ' . "\n"
        . '>> * * ポイント * *' . "\n"
        . '>> ' . $value . "\n"
        . '>>' . "\n"
        . '>> * * * end * * * ' . "\n";
    print $msg;
    return;
}

1;

__END__
