## ■well断
サービスurl: https://welldoneshari.com/

## ■サービス概要

持っている服を管理し、断捨離をサポートするサービスです。
服を登録して可視化したり、チェックリストを作成して自分なりの断捨離基準を決めることができます。
さらに、他ユーザーの断捨離タイムラインを閲覧することで、服の棚卸しを促します。

## ■ このサービスへの思い・作りたい理由

大学で経済学を学んでいた際、ボードリヤールの「記号消費」という理論に強い衝撃を受けたのがきっかけです。
この理論では、資本主義社会において消費は経済循環のために促進され、そこで表現される個人のアイデンティティは意味を持たなくなっているとされています。
この考えに触れて以来、私は「社会に消費させられる」のではなく、自分の意思や価値観、どんな自分を好むのかといった“自己との対話”を通じて、何を所有するかを選ぶべきだと考えるようになりました。
とはいえ、人間の欲には限りがなく、つい衝動的にモノを買ってしまうこともあります。
そうした経験を少しでも減らし、管理できるアプリを作りたいと考えました。

## ■ ユーザー層について

* 服を捨てるのが好きな人

クローゼットの可視化やチェックリストの作成から、スムーズな服の管理を提供できるため

* 服を捨てるのが苦手な人

服を捨てたくてもなかなか出来ない人に、そのきっかけを提供できるため

## ■サービスの利用イメージ

* 持っている服の価値を見直し、新しく服を購入する際の判断材料として活用できます。
タイムラインを閲覧することで、他のユーザーの断捨離の様子から刺激を受け、行動のきっかけにもなります。
* 断捨離チェックリストを作成できるため、ユーザーごとに自分だけの断捨離基準を持つことができます。
* 季節の変わり目にはメルマガを配信し、サービスに再びアクセスするきっかけを提供します。

## ■ ユーザーの獲得について

* 知人への宣伝
* SNSでの宣伝

## ■ サービスの差別化ポイント・推しポイント

類似サービスはいくつか存在しますが、
服の管理系サービスの多くは「服を買う・コーディネートを楽しむ」ことが主なコンセプトです。
一方、断捨離系のサービスは「他のユーザーの断捨離の様子を見て刺激を受ける」といったコミュニティ性を重視しているものが多く、当サービスもこの点に共感し、一部取り入れています。
当サービスでは、「服を買わせる」ことを目的とせず、
ユーザーの購入動機の見直しや、持ち物の最適化をサポートすることを重視しています。
コミュニティの力を活用しながら、断捨離を習慣化できるサービスを目指しています。

## ■ 機能

### MVPリリース
* ユーザー登録
* ログイン/ログアウト
* google認証
* プロフィール
* クローゼット
  -  画像アップロード
  -  動的セレクトタグ
  -  複数チェックボックス
* チェックリスト
  - オリジナルアイテム作成

### 本リリース
* 送信専用メールマガジン
* クローゼット
  - お気に入り
  - マルチ検索
  - 断捨離タイムライン
  - xシェア
  - 静的OGP
  - ページネーション
* チェックリスト
  - デフォルトアイテム選択
* 使い方ガイド
* レスポンシブ対応
* ローディングアニメーション
* モーダル
* 独自ドメイン
* ファビコン
* RSpec
* CI
* Rubocop
* google analytics
* 利用規約
* プライバシーポリシー
* 問い合わせ

## ■ 機能

<table class="table-fixed w-full border border-gray-300 text-left">
  <thead class="bg-gray-100">
    <tr>
      <th class="p-2 border">カテゴリ</th>
      <th class="p-2 border">技術</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="p-2 border">フロントエンド</td>
      <td class="p-2 border">TailwindCSS / daisyUI / Stimulus</td>
    </tr>
    <tr>
      <td class="p-2 border">バックエンド</td>
      <td class="p-2 border">Rails 7.2.2.1 (Ruby 3.3.6)</td>
    </tr>
    <tr>
      <td class="p-2 border">データベース</td>
      <td class="p-2 border">PostgreSQL</td>
    </tr>
    <tr>
      <td class="p-2 border">開発環境</td>
      <td class="p-2 border">Docker</td>
    </tr>
    <tr>
      <td class="p-2 border">インフラ</td>
      <td class="p-2 border">Render / Amazon S3</td>
    </tr>
    <tr>
      <td class="p-2 border">API</td>
      <td class="p-2 border">OmniAuth Google OAuth2</td>
    </tr>
    <tr>
      <td class="p-2 border">VCS</td>
      <td class="p-2 border">GitHub</td>
    </tr>
    <tr>
      <td class="p-2 border">CI/CD</td>
      <td class="p-2 border">GitHub Actions</td>
    </tr>
  </tbody>
</table>

## 画面遷移図URL
https://www.figma.com/design/2PASTSWNR4TC8jwnrG6P4L/Graduation_app_project?node-id=0-1&t=M9SxuYDVr2a0GA5S-1

## ER図
[![Image from Gyazo](https://i.gyazo.com/e1960546ce7a6a66ca8296ca946b624c.png)](https://gyazo.com/e1960546ce7a6a66ca8296ca946b624c)
