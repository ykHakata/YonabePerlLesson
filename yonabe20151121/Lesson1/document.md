# Lesson1 基本的なホームページの仕組み

シンプルテキストのデーターを WEB サーバーとやり取りしている

    [リクエスト]
    [PC手元] -> [ケーブル or 無線] -> [PCサーバー]

    [レスポンス]
    [PC手元] <- [ケーブル or 無線] <- [PCサーバー]

今回は [PCサーバー] をさくらインターネットのライトプランで試してみる

    さくらインターネットライトプランの用意

    さくらインターネット公式サイトにアクセス
    http://www.sakura.ad.jp

    会員メニュー(ログイン必要)
    https://secure.sakura.ad.jp/menu/top/

    契約情報
    https://secure.sakura.ad.jp/menu/service/
    契約情報の確認をクリック

    申し込んだ、ライトプランの「サーバー設定」クリック

    初期ドメインを確認
    yonabe.sakura.ne.jp(このドメインはそれぞれ違います)
    初期ドメインのリンクをクリックして表示されれば、利用できる状態になってる

アップロードするための HTML ファイルを作成する

    Lesson1/Sample/lesson1.html を参考に
    Lesson1/Note/lesson1.html を完成させる

    TAG<index>
    HTML, CSS のタグを調べる時や基本的なJavaScript
    http://www.tagindex.com/index.html

アップロードする

    さくらインターネットサーバーコントロール画面から

    運用に便利なツール -> ファイルマネージャー クリック

    ファイルマネージャーを使ってアップロード

    アップロード -> クリック
    ファイルを追加 -> クリック
    先ほど作成した、 lesson1.html を選択
    アップロード開始 -> クリック
    同名のファイルを上書きしてアップロードしますか？ -> はい
    状態が完了 -> 閉じるをクリック

    先ほど開いたさくらインターネットの自身のサイト Index of /
    をリロードするとアップロードしたファイルが見える
    lesson1.html のリンクをクリック

出力されている画面の体裁をととのえる、スタイルシート

    Lesson1/Sample/lesson1_deco.html
    Lesson1/Sample/lesson1_deco.css を参考に

    Lesson1/Note/lesson1_deco.html
    Lesson1/Note/lesson1_deco.css を完成させる

    さきほどと同様の手順でアップロード、画面の確認をしてみる

まとめ

    一般的にいうホームページは HTML 形式で記述された
    シンプルテキストファイルを WEB サーバーを使ってはきだしている
