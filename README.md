# テーブル設計

## Usersテーブル

| Column             | Type   | Option      |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_reading | string | null: false |
| last_name_reading  | string | null: false |
| birth_day          | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## Itemsテーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| introduction       | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| postage_payer_id   | integer    | null: false                    |
| prefecture_code_id | integer    | null: false                    |
| preparation_day_id | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase

## Purchasesテーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :destination

## Addressesテーブル

| Column             | Type        | Option                         |
| ------------------ | ----------- | ------------------------------ |
| post_code          | string      | null: false                    |
| prefecture_code_id | integer     | null: false                    |
| city               | string      | null: false                    |
| address            | string      | null: false
| building_name      | string      |                                |
| phone_number       | string      | null: false                    |
| purchase           | preferences | null: false, foreign_key: true |

### Association

- belongs_to :purchase
