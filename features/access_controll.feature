フィーチャ: アクセス管理
  ユーザからノートやページに対するアクセス制御をしたい

  背景:
    前提  言語は"ja-JP"
    かつ  ユーザ"alice"を登録し、ログインする
    かつ  ノート"a_note"が作成済みである
    かつ  ノート"a_note"の公開範囲を「全員が読める。メンバーのみが書き込める。」に設定する
    かつ  ノート"a_note"のページ"FrontPage"を表示している

  シナリオ: ノートの作成者はノートへアクセスできる
    もし  ノート"a_note"のページ"FrontPage"を表示している
    ならば "SKIP Wikiへようこそ"と表示されていること
    かつ   "未公開にする"というボタンがあること

  シナリオ: 全員が読める、メンバーのみ書けるノートへ、ゲストがアクセスする
    もし   "ログアウト"リンクをクリックする
    かつ   ユーザ"bob"を登録し、ログインする
    かつ   ノート"a_note"のページ"FrontPage"を表示している

    ならば "SKIP Wikiへようこそ"と表示されていること
    かつ   "ページ一覧"というリンクがあること
    かつ   ページの内容変更へのナビゲーションがないこと
    かつ   ページのメタデータ変更へのナビゲーションがないこと
    かつ   ノート全体の操作をするためのナビゲーションがないこと

    もし   "ページ一覧"リンクをクリックする
    ならば "表紙"と表示されていること

    もし   ノート"a_note"の情報を表示している
    ならば "ページが存在しない、またはアクセスする権限がありません。"と表示されていること

  シナリオ: 全員が読めるノートであっても、公開前のページはグループ外のユーザからアクセスできない
    前提  ノート"a_note"のページ"FrontPage"を表示している

    もし  ノートのラベルバー設定を"常に表示する"にする
    かつ  ノート"a_note"のページ"FrontPage"を表示している
    かつ  "未公開にする"ボタンをクリックする
    かつ  "ログアウト"リンクをクリックする

    かつ  ユーザ"bob"を登録し、ログインする
    かつ  ノート"a_note"のページ"FrontPage"を表示している
    ならば "ページが存在しない、またはアクセスする権限がありません。"と表示されていること

    前提  そのノートにはページ"2ndPage"が作成済みである
    もし  ノート"a_note"のページ"2ndPage"を表示している

    ならば "2ndPage"と表示されていること
    かつ   "表紙"と表示されていないこと

  シナリオ: グループメンバーのみがアクセスできるノートにはグループ外ユーザからはアクセスできない
    もし   ノートメニューの"プロパティ"リンクをクリックする
    かつ   "ノートのプロパティを編集"リンクをクリックする
    かつ   "メンバーのみが読み書きできる"を選択する
    かつ   "更新"ボタンをクリックする
    かつ   "ログアウト"リンクをクリックする
    かつ   ユーザ"bob"を登録し、ログインする

    もし   ノート"a_note"の情報を表示している
    ならば "ページが存在しない、またはアクセスする権限がありません。"と表示されていること

    もし   ノート"a_note"のページ"FrontPage"を表示している
    ならば "ページが存在しない、またはアクセスする権限がありません。"と表示されていること

  シナリオ: 全員が読み書きできるノートへ、ゲストがアクセスする
    前提   ノート"a_note"の公開範囲を「全員が読み書きできる」に設定する
    かつ   "ログアウト"リンクをクリックする
    かつ   ユーザ"bob"を登録し、ログインする

    もし  ノート"a_note"のページ"FrontPage"を表示している

    ならば "SKIP Wikiへようこそ"と表示されていること
    かつ   ページの内容変更へのナビゲーションがあること
    かつ   ノート全体の操作をするためのナビゲーションがないこと
    かつ   ページのメタデータ変更へのナビゲーションがないこと

    もし   ページメニューの"編集"リンクをクリックする
    かつ   "内容"に"全員読み書きできるよ!!"と入力する
    かつ   "ページを更新"ボタンをクリックする
    ならば "全員読み書きできるよ!!"と表示されていること
    かつ   "ラベルなし"と表示されていること

    # TODO
    # もし   ページメニューの"プロパティ"リンクをクリックする
    # かつ   "ラベル 9"を選択する
    # かつ   "ページを更新"ボタンをクリックする
    # ならば "ラベル 9"と表示されていること

    もし   ページメニューの"履歴"リンクをクリックする
    ならば "編集履歴"と表示されていること

    もし   "前"リンクをクリックする
    ならば "SKIP Wikiへようこそ"と表示されていること
    かつ   "全員読み書きできるよ!!"と表示されていること

    もし   "添付ファイル一覧"リンクをクリックする
    ならば "ファイルを添付"と表示されていること
    かつ   "添付ファイル一覧"と表示されていること

    かつ   "ファイルを添付"としてファイル"spec/fixtures/data/at_small.png"をContent-Type"image/png"として添付する
    かつ   "アップロード"ボタンをクリックする

    ならば "添付ファイル一覧"と表示されていること
    かつ "at_small.png"と表示されていること

    もし   ノート"a_note"の情報を表示している
    ならば "ページが存在しない、またはアクセスする権限がありません。"と表示されていること

  シナリオ: 全員が読み書きできるノートなら、未公開ページへもゲストがアクセスできる
    前提   ノート"a_note"の公開範囲を「全員が読み書きできる」に設定する
    かつ   ノート"a_note"のページ"FrontPage"を表示している
    かつ   "未公開にする"ボタンをクリックする
    かつ   "ログアウト"リンクをクリックする
    かつ   ユーザ"bob"を登録し、ログインする

    もし   ノート"a_note"のページ"FrontPage"を表示している
    ならば "SKIP Wikiへようこそ"と表示されていること

  シナリオ: 全員が読み書きできるノートでも、ゲストはノート全体の操作ができない
    前提   ノート"a_note"の公開範囲を「全員が読み書きできる」に設定する
    かつ   ノート"a_note"のページ"FrontPage"を表示している
    かつ   "未公開にする"ボタンをクリックする
    かつ   "ログアウト"リンクをクリックする
    かつ   ユーザ"bob"を登録し、ログインする
    もし   ノート"a_note"のページ"FrontPage"を表示している
    ならば ノート全体の操作をするためのナビゲーションがないこと

  シナリオ: 管理者権限を持っていないユーザは管理者メニューにアクセスできない
    もし    ノート"a_note"のページ"FrontPage"を表示している
    ならば  "システムの設定"と表示されていないこと

  シナリオ: 管理者ユーザは管理者メニューにアクセスできる
    かつ ユーザ"dammyadmin"を管理者として登録し、ログインする
    ならば "システムの設定"と表示されていること

