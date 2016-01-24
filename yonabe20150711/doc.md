### WEBブラウザでWEBページが表示される仕組み(前編)

WEB ブラウザの準備

    ファイアフォックスをインストールする

    https://www.mozilla.org/ja/firefox/new/

さくらインターネットのおためしを利用申し込み

    利用できるようになるのに30分ほどかかる可能性があるので
    事前に申し込みをしておく

レンタルサーバーをおためし

    さくらインターネット
    http://www.sakura.ad.jp/

    メニュー -> レンタルサーバー -> ライト(2週間のおためし)

    ・はじめて利用する
    ・会員IDがある、現在さくらを利用中
    いづれかを選択

    初期ドメイン名を決める yonabe と 自分のイニシャルにしておく
    例: yonabeyk

    クレジットカード情報入力

    最終のご確認、間違いなければお申し込みする

    メールにてお申し込み受付完了のお知らせが来るので
    メールに記載のリンクより状況の確認をする

    https://secure.sakura.ad.jp/menu/domain/

    会員メニュー > ドメイン > 管理ドメインとネームサーバの一覧

    初期ドメインが存在するか確認

    会員メニュー > ドメイン > ネームサーバーメニュー

    ゾーン名にある yonabeyk.sakura.ne.jp をwebブラウザに入力

    おそらくこういう画面がでる

    -----

    Index of /
    [ICO]   Name    Last modified   Size    Description

    -----

テキストエディッタで HTML ファイルを記述

    すぐに使えるテキストエディッタを準備

    下記サイト参考
    http://techacademy.jp/magazine/986

    Windows は TeraPad（テラパッド）
    http://techacademy.jp/magazine/4179

    Mac は mi（ミ）
    http://techacademy.jp/magazine/4534

最低限度の環境設定

    拡張子を表示するを設定する

    Windows は下記参照
    http://121ware.com/qasearch/1007/app/servlet/qadoc?QID=013988

    Mac は下記参照
    http://pc-karuma.net/mac-finder-show-file-extensions/

HTML ファイルの作成

    ファイルを保存する場所を決め、yonabe という新規フォルダを作成

    Mac は ホームディレクトリ -> 書類 -> yonabe(フォルダ)

    Windows は マイドキュメント -> yonabe(フォルダ)

    ファイル名を決める: yonabe.html

    テキストエディタで最初に空のファイルにファイル名を付けて保存

    文字コードは utf-8 にしておく

    下記をファイルに記述後、保存

-----

    <!DOCTYPE html>
    <html>
    <head>
        <title>title yonabe</title>
    </head>
    <body>
        <p>yonabe Perl web site</p>
    </body>
    </html>

HTML ファイルを直接開く

    WEB ブラウザに表示されている内容を確認

    ファイアフォックス -> ファイル -> ファイルを開く -> yonabe.html をひらく

    WEB ブラウザに表示されたのを確認できたら

    ツール -> WEB 開発 -> ページのソース
    もしくは
    画面を右クリックで ページのソースを表示

    WEBブラウザが HTML ファイルをレンダリングしている

    レンダリング (rendering)
    取得したデータを整形して、ユーザーの目に見える形で表示

    WEB ブラウザは HTML の形式で記述されたテキストファイルをレンダリングする

作成した HTML ファイルをインターネットの世界へ公開

    さくらインターネットのおためしを利用申し込みのつづきをする

    さくらインターネットより仮登録完了のメールが来たのを確認する
        *メールが来るのに30分程度かかる可能性があるので注意

http://yonabeyk.sakura.ne.jp

 URL             ： https://secure.sakura.ad.jp/rscontrol/
 ドメイン名      ： yonabeyk.sakura.ne.jp
 サーバパスワード： 6ywk4he2v6

    手順はさくらインターネットサイトの資料を参考にする

    https://help.sakura.ad.jp/app/answers/detail/a_id/2302
    の
    ファイルをサーバへアップロードするを参考

    サーバーコントロールパネル にログイン
    パスワードなどはメールに記載してある

    WEBブラウザでアクセスする

    yonabeyk.sakura.ne.jp/yonabe.html

    を入力する、WEBブラウザに表示された

    PC, スマホ, タブレット端末でも表示可能

    なにをやっているのか

    WEBブラウザ(PC) -> インターネット -> WEB サーバー(さくらインターネット)
    (WEB サーバーへリクエスト)

    WEBブラウザ(PC) <- インターネット <- WEB サーバー(さくらインターネット)
    (WEB サーバーからレスポンス)

まとめ

    ・WEBブラウザはHTML形式のテキストファイルをレンダリングする
    ・WEBブラウザが使えるコンピューター端末ならWEBサーバーにアクセスできる
    ・インターネットが利用できる回線に繋がっていればどこからでもWEBサーバーにアクセスできる

    次回はWEBブラウザとWEBサーバーの間でなにが行われているか詳しく見ていきます。

### WEBブラウザでWEBページが表示される仕組み(後編)

URL の意味

    URL (Uniform Resource Locator, ユニフォームリソースロケータ)

    さくらインターネットのサイトにアクセスしてみる

    さくらインターネット
    http://www.sakura.ad.jp

    http -> (プロコトル名)
    www.sakura.ad.jp -> (ドメイン名)
    * ドメイン名をサーバー名と言う事もありますが、
        ここではドメイン名にしておきます。

    イメージ
    接続方式を指定://アクセスするWEBサーバーを指定

ドメイン名の正体

    入力の方法を変えてみる
    http://210.224.168.100

    www.sakura.ad.jp(ドメイン名) = 210.224.168.100(IPアドレス)

    web サーバーにアクセスする前に DNS サーバーにアクセスして IP アドレス取得

    WEBブラウザ(PC) -> インターネット -> DNS サーバー(質問 www.sakura.ad.jp)
    WEBブラウザ(PC) <- インターネット <- DNS サーバー(回答 210.224.168.100)
    WEBブラウザ(PC) -> インターネット -> WEB サーバー(IP 210.224.168.100)
    WEBブラウザ(PC) <- インターネット <- DNS サーバー(該当の HTML ファイル)
    WEBブラウザ(PC) (レンスポンスされた HTML ファイルをレンダリング)

    DNS サーバーにドメイン名に該当する IP アドレスを問い合わせた後に
    該当する IP アドレスにひも付けられた WEB サーバーにアクセスする

ドメイン名から該当の IP アドレスを調べて見る

    さくらインターネットの場合
    www.yonabeyk.sakura.ne.jp

    Mac はターミナルから Windows はコマンドプロンプトから

    -----

    nslookup www.sakura.ad.jp

    ...

    Non-authoritative answer:
    Name:   www.sakura.ad.jp
    Address: 210.224.168.100

    -----

    ドメイン名から IP アドレスを特定する事が出来る

    他の web サイトの IP アドレスも取得してみる

    例:
    はてな(ポータルサイト)
        http://www.hatena.ne.jp/
        http://59.106.194.19

        nslookup www.hatena.ne.jp

    ゲオ(レンタルビデオサイト)
        http://rental.geo-online.co.jp/
        http://203.131.196.216

        nslookup rental.geo-online.co.jp

    キャンプファイアー(クラウドファンディングサイト)
        http://camp-fire.jp/
        http://54.248.216.97

        nslookup camp-fire.jp

    -----

    ドメイン名に対して、一つの IP アドレスが紐付いているのがわかる

    基本はドメイン名と IP アドレスは一つづつの組み合わせであるが
    現実的には複数の組み合わせが存在する

    例:
    ヤフー(ポータルサイト)

    http://www.yahoo.co.jp/
    http://118.151.231.231
    http://182.22.39.242
    http://182.22.40.240
    http://183.79.231.182

    nslookup www.yahoo.co.jp

    一つのドメイン名に対して複数の IP アドレスが登録されている

    例:
    前回利用したさくらインターネット

    http://yonabeyk.sakura.ne.jp
    http://219.94.129.90

    nslookup yonabeyk.sakura.ne.jp

    IP アドレスでは直接アクセスする事ができない

    《 サーバコントロールパネル ログイン情報 》
        送信されたメールにのっている

    ....
    URL             ： https://secure.sakura.ad.jp/rscontrol/

    サーバ情報の表示 -> サーバに関する情報 -> ホスト名
    www1080.sakura.ne.jp
