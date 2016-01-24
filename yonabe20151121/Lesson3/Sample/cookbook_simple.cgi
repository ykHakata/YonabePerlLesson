#!/usr/bin/perl
use strict;
use warnings;
use utf8;
use CGI;
use DBI;
binmode STDOUT, ':encoding(UTF-8)';
binmode STDIN,  ':encoding(UTF-8)';

my $q = CGI->new();

print $q->header( -type => 'text/html', -charset => 'utf-8', );

my $recipe_id = $q->param('recipeId') ? $q->param('recipeId') : '';

# メニュー用のレシピの id と title を取得
my $get_title_sql = q{SELECT id, title FROM recipe;};
my $title_rows = get_recipe_rows( $get_title_sql, [] );

# 検索用のメニューの html を作成
my $contents_navi = '';

for my $title_row ( @{$title_rows} ) {
    $contents_navi
        .= qq{<p><input type="radio" name="recipeId" value="$title_row->{id}">$title_row->{title}</p>\n}
        . qq{      };
}

# id からレシピの詳細を検索
my $search_id_sql = q{SELECT * FROM recipe where id = ?;};
my $recipe_rows
    = $recipe_id ? get_recipe_rows( $search_id_sql, [$recipe_id] ) : [];

# html のタグに埋め込むためにテキストを加工
my ($title)     = map { $_->{title} } @{$recipe_rows};
my ($foodstuff) = map { get_split_html( $_->{foodstuff} ) } @{$recipe_rows};
my ($recipe)    = map { get_split_html( $_->{recipe} ) } @{$recipe_rows};
my ($point)     = map { $_->{point} } @{$recipe_rows};

# 指定の条件から検索結果をハッシュのリファレンツで取得
sub get_recipe_rows {
    my $sql         = shift;
    my $bind_values = shift;
    my $dbh         = DBI->connect(
        'dbi:SQLite:dbname=./cookbook.db',
        '', '', +{ RaiseError => 1, sqlite_unicode => 1, },
    );
    my $rows
        = $dbh->selectall_arrayref( $sql, +{ Slice => {} }, @{$bind_values},
        );
    $dbh->disconnect();
    return $rows;
}

# カンマ区切りのテキストを<p>タグで囲って分解
sub get_split_html {
    my $text      = shift;
    my @text_rows = split ',', $text;
    my $html      = '';
    for my $text_row (@text_rows) {
        $html .= "<p>$text_row</p>\n      ";
    }
    return $html;
}

# 検索指定されたid からメニュー詳細を取得
my $html = <<"HTML_END";
<!DOCTYPE html>
<html>
<head>
  <title>cookbook_simple</title>
</head>
<body>
  <div id="wrapper">

    <div id="header">
      <h1 id="siteTitle">cookbook_simple / レシピ検索(簡易版)</h1>
    <!-- /#header --></div>

    <div id="contentsNavi">
      <form method="get" action="cookbook_simple.cgi">
      $contents_navi<p><input type="submit" value="検索する"></p>
      </form>
    <!-- /#contentsNavi --></div>

    <div id="contentsDetail">
      <p> * * * $title * * * </p>
      <p></p>
      <p> * * 材料 * * </p>
      $foodstuff
      <p></p>
      <p> * * 作り方 * * </p>
      $recipe
      <p></p>
      <p> * * ポイント * * </p>
      <p>$point</p>
    <!-- /#contentsDetail --></div>

  <!-- /#wrapper --></div>
</body>
</html>
HTML_END

print $html;
