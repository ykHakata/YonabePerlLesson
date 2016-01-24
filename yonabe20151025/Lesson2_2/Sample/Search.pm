package Search;
use strict;
use warnings;
use utf8;

binmode STDOUT, ':encoding(UTF-8)';
binmode STDIN,  ':encoding(UTF-8)';

=encoding utf8

=head1 NAME (名前)

Search - 検索機能

=head1 SYNOPSIS (概要)

cookbook アプリの検索に関する機能

=cut

=head2 start

    検索実行

=cut

sub start {
    my $type  = shift;
    my $value = shift;
    die 'not type!! or value!!' if !$type || !defined $value;
    return _food( $type, $value ) if $type eq 'food' && $value eq 'title';
    return _food( $type, $value ) if $type eq 'food' && $value eq 'numbers';
    return _food( $type, $value ) if $type eq 'search_food';
    die 'search does not exist!!';
}

sub _food {
    my $type  = shift;
    my $value = shift;

    my $file_path = './recipe.txt';
    open my $recipe_fh, '<:encoding(UTF-8)', $file_path
        or die "Can't open '$file_path': $!";

    my $food = +{
        search_type  => $type,
        search_value => $value,
        row          => '',
        count        => 0,
        title        => '',
        numbers      => [],
        detail       => +{
            food_title => '',
            foodstuff  => [],
            recipe     => [],
            point      => '',
        },
    };

    SEARCH_RECIPE:
    while ( my $recipe_row = <$recipe_fh> ) {
        chomp $recipe_row;
        next SEARCH_RECIPE if !$recipe_row;
        $food->{row} = $recipe_row;
        $food = _count_up($food);
        $food = _get_title($food);
        $food = _get_numbers($food);
        $food = _get_food_detail($food);
    }

    my $search_cookbook_number = 0;
    push @{ $food->{numbers} }, $search_cookbook_number;

    return $food->{title}   if $type eq 'food' && $value eq 'title';
    return $food->{numbers} if $type eq 'food' && $value eq 'numbers';
    return $food->{detail};
}

sub _count_up {
    my $food = shift;
    my ( $title, $word ) = split ':', $food->{row};
    $food->{count} += $title eq 'タイトル' ? 1 : 0;
    return $food;
}

sub _get_title {
    my $food = shift;
    my ( $title, $word ) = split ':', $food->{row};
    if ( $title eq 'タイトル' ) {
        $food->{title} .= '>> [' . $food->{count} . '] ' . $word . "\n";
    }
    return $food;
}

sub _get_numbers {
    my $food = shift;
    push @{ $food->{numbers} }, $food->{count};
    return $food;
}

sub _get_food_detail {
    my $food = shift;
    return $food if $food->{search_type} ne 'search_food';
    return $food if $food->{count} ne $food->{search_value};
    $food = _get_food_title($food);
    $food = _get_foodstuff($food);
    $food = _get_recipe($food);
    $food = _get_point($food);
    return $food;
}

sub _get_food_title {
    my $food = shift;
    my ( $title, $word ) = split ':', $food->{row};
    if ( $title eq 'タイトル' ) {
        $food->{detail}->{food_title} = $word;
    }
    return $food;
}

sub _get_foodstuff {
    my $food = shift;
    my ( $title, $word ) = split ':', $food->{row};
    if ( $title eq '材料' ) {
        $food->{detail}->{foodstuff} = [ split ',', $word ];
    }
    return $food;
}

sub _get_recipe {
    my $food = shift;
    my ( $title, $word ) = split ':', $food->{row};
    if ( $title eq '作り方' ) {
        $food->{detail}->{recipe} = [ split ',', $word ];
    }
    return $food;
}

sub _get_point {
    my $food = shift;
    my ( $title, $word ) = split ':', $food->{row};
    if ( $title eq 'ポイント' ) {
        $food->{detail}->{point} = $word;
    }
    return $food;
}

1;

__END__
