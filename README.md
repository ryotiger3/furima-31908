#　テーブル設計

## usersテーブル

| Column           | Type    | Options     |
| -----------------| ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |
| date_of_birth    | date    | null: false |

## Association
- has_many :products
- has_many :destinations
- has_many :purchase_histories


## productsテーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | string     | null: false                    |
| description      | text       | null: false                    |
| category         | string     | null: false                    |
| condition        | string     | null: false                    |
| shipping_charges | string     | null: false                    |
| shipping_days    | string     | null: false                    |
| shipping_area    | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_one :purchase_histories

## destinationsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| purchase         | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :purchase_history

## purchase_historiesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| product          | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :product
- has_many :destinations