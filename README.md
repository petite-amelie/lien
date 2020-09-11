# README

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

| Column          | Type    | Options                        |
| ----------      | ------  | ------------------------------ |
| name            | string  | null: false                    |
| introduction    | string  | null: false                    |
| genre           | string  | null: false                    |
| user_id         | integer | null: false, foreign_key :true |

### Association
- has_many :items
- belongs_to :user



## Itemsテーブル

| Column          | Type    | Options                        |
| ----------      | ------  | ------------------------------ |
| name            | string  | null: false                    |
| introduction    | string  |                                |
| price           | integer |                                |
| room_id         | integer | null: false, foreign_key :true |
| user_id         | integer | null: false, foreign_key :true |
| likes_count     | integer |                                |

### Association
- has_one :order
- has_many :likes
- belongs_to :room
- belongs_to :user


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
| building_number | string  |                                |
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






























This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
