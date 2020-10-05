# README
![screenshot](https://user-images.githubusercontent.com/69502265/95057404-15796000-0731-11eb-85d4-6b6b06d2e2d7.png)
# LIEN.
 
 「アート」をもっと身近な存在に。  
 オンラインで個展を気軽に出すことができるオンライン個展アプリ「LIEN.」
 
## 簡単な説明
 
「LIEN.」は「個展を出してみたいが一歩踏み出せない」、「もっとたくさんの方に作品を見ていただきたい」というアーティストと、「アートや個展などに興味があるけど直接見に行くのはハードルが高い」、「気になるアーティストの個展に行きたいが遠方のためいけない」という方々を繋ぐアプリです。アーティストはネット上に簡単に個展を出すことができ、観覧側は登録などの面倒な手続きなく作品を見ることができます。（購入の際には登録が必要となります。）　　

 
## 機能
 
- 個展・作品の登録・編集・削除・検索・購入機能
- ユーザー登録機能
- いいね機能
- 個展の公開・非公開機能
 など
 
## 必要要件
 
- MacOS/Google Chrome環境での動作確認済みです。
- Windowsでの動作確認はできていません
 
## 使い方
- アーティスト側
1. まずユーザー登録をしてください
2. ユーザー登録が完了したら、TOPページ上部のcreateボタンを押して個展を作成してください
3. 個展の情報ができたら、作品の追加を行ってください
4. 最後に登録した個展の公開をするかしないかの選択を公開・非公開ボタンより選択してください
5. 登録された個展はマイページ下部の個展一覧に追加されています。（個展をクリックすることで編集・削除等可能です）  

- 観覧側
1. TOPページを見ていただき期になる個展・作品をジャンルまたは検索フォームよりお探しいただくか、人気の個展一覧よりお探しください
2. 購入を希望される方はユーザー登録を行いログインした状態で作品の詳細画面より購入ボタンを押してください
 

## LIENを制作した経緯
 
以前よりかは増えたかとは思いますが、日本人にとってアートは未だに身近な存在とは言えないでしょう。
特に絵画や彫刻などファッションの様に生活に必須とされていないアートは遠い存在と考えるひとが多いかと思います。
それはきっと今の日本はアートと触れる機会がとても少ないからではないかと考えました。
きっと「アートに触れたいけどいきなり個展には行きづらい」、「どの個展や展示会に行ったらいいのか分からない」、「とりあえず気軽にいろんな作品を見てみたい」そんな方の課題を解決したいと思いました。
その問題を解決することでアーティスト達の作品がたくさんの方に知られ、世の中の人々を癒し、元気付けてくれると考えました。
私はフランスに1年間ほど留学していたのですが、その中で驚いた一つの中にアートがみんなの日常生活に溶け込んでいたことです。
レストランやカフェには絵画や彫刻などが飾られていて、街中の路面店には数多くのアーティストの作品が売られています。
そしてその作品達を見ながら自分の意見を話し合う光景が数多く見られました。
そしてアートはフランス人を癒し元気にする存在なのです。
私もアートは人の心を癒したり、慰めたり、鼓舞してくれる大切な存在だと感じます。
日本にもたくさんのアーティストがいて数多くの作品があります。しかし、コロナの影響もありその作品達は人の目に触れる機会がとても少ないのです。
気軽にartに触れてみたい方々のために。
**「作品(art)と人をつなげる手助けをしたい」**という思いのこもったアプリが"LIEN"(フランス語で繋ぐの意)です。

## 作者
 
小木 翔平
mail to: @mail.com
 



## Usersテーブル

| Column          | Type   | Options     |
| ----------      | ------ | ----------- |
| nickname        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| phone_number    | string | null: false |
| email           | string | null: false |
| birth           | date   | null: false |
| password        | string | null: false |

### Association
- has_one :address
- has_many :likes
- has_many :orders
- has_many :items
- has_many :rooms


## Roomsテーブル

| Column               | Type    | Options                        |
| -------------------- | ------  | ------------------------------ |
| room_name            | string  | null: false                    |
| room_introduction    | string  | null: false                    |
| genre                | string  | null: false                    |
| user_id              | integer | null: false, foreign_key :true |

### Association
- has_many :items
- belongs_to :user



## Itemsテーブル

| Column               | Type    | Options                        |
| -------------------- | ------  | ------------------------------ |
| item_name            | string  | null: false                    |
| item_introduction    | string  |                                |
| price                | integer |                                |
| room_id              | integer | null: false, foreign_key :true |

### Association
- has_one :order
- has_many :likes
- belongs_to :room


## Likesテーブル
| Column  | Type    | Options                        |
| ------- | ------  | ------------------------------ |
| user_id | integer | null: false, foreign_key :true |
| item_id | integer | null: false, foreign_key :true |

### Association
- belongs_to :user
- belongs_to :item


## Addressテーブル
| Column          | Type        | Options                    |
| --------------- | ------- | ------------------------------ |
| postal_code     | string  | null: false                    |
| prefecture_id   | integer | null: false                    |
| city            | string  | null: false                    |
| house_number    | string  | null: false                    |
| building_name   | string  |                                |
| user_id         | integer | null: false, foreign_key :true |
| order_id        | integer | null: false, foreign_key :true |

### Association
- belongs_to :order
- belongs_to :user



## Ordersテーブル
| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| item_id | integer | null: false, foreign_key :true |
| user_id | integer | null: false, foreign_key :true |

### Association
- has_one :address
- belongs_to :item
- belongs_to :user

