# dazzling
舞台観劇を通して繋がる、簡単な口コミサービスです。

![dazzling_home](https://user-images.githubusercontent.com/55808655/93812414-8a0dc280-fc8c-11ea-8033-9996d6f8d8d2.png)
![スクリーンショット 2020-09-22 5 40 10（2）](https://user-images.githubusercontent.com/55808655/93819108-44ee8e00-fc96-11ea-864b-c0ac34cf7ea8.png)

## URL
AWSへデプロイ作業中、近日公開

## 概要
- HOME画面の左端及び下部分に"ゲストログイン"のボタンを押下することでアカウントを作成することなく、ゲストユーザーとして、ログインすることができます。
- 静的解析ツールとしてrubocopを利用しており、現時点では違反レベル C 以上はございません。

## 使用技術
- Ruby -ver 2.7.0 / Rails -ver 5.2.4.3
- HTML (erb), Scss, Bootstrap4, JavaScript, jQuery
- AWS(VPC, EC2, RDS for MySQL)
- GoogleMapsAPI
- RSpec(現状は、user、post部分のみ)

## 開発環境
ローカル(Rubymine -ver 2019-3)

## 機能一覧
- ログイン/ログアウト機能(device)
- 投稿、投稿編集機能
- 投稿詳細表示機能
- 投稿コメント機能
- 投稿一覧表示ページネーション機能(kaminari)
- 星評価機能
- いいね機能(Ajax 非同期処理)
- フォロー機能(Ajax　非同期処理)
- プロフィール編集機能(アイコン画像あり)
- ダイレクトメッセージ機能(フォロワー同士)
- キーワード検索機能(口コミ投稿及びユーザー)
- タグ紐付け機能
- 開催場所表示機能(Google map API)

### 今後の実装予定機能
- 開発環境にDockerを導入(取り掛かり、作業中)
- 管理者リレーション機能
- CircleCIを使用してCI/CDパイプラインを構築しテスト自動化、脆弱性診断の自動化の組み込み
  <p><参考></p>
  <p>https://tech.pepabo.com/2019/12/16/vaddy/</p>
  <p>https://itnews.org/news_contents/product-probely</p>

## ER図
![スクリーンショット 2020-09-22 5 19 47（2）](https://user-images.githubusercontent.com/55808655/93817112-7023ae00-fc93-11ea-8108-b99601798870.png)
