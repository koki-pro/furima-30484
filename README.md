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
| birth_year         | date   | null: false |
| birth_month        | date   | null: false |
| birth_day          | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## Itemsテーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| introduction    | text       | null: false                    |
| category        | integer    | null: false                    |
| condition       | integer    | null: false                    |
| postage_payer   | integer    | null: false                    |
| prefecture_code | integer    | null: false                    |
| preparation_day | integer    | null: false                    |
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- has_many   :images
- belongs_to :user

### Imagesテーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| image           | string     | null: false                    |
| item_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :item

## Purchasesテーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## Addressテーブル

| Column          | Type        | Option                         |
| --------------- | ----------- | ------------------------------ |
| post_code       | string      | null: false                    |
| prefecture_code | integer     | null: false                    |
| city            | string      | null: false                    |
| building_name   | string      |                                |
| phone_number    | string      | null: false                    |
| purchase_id     | preferences | null: false, foreign_key: true |

### Association

- belongs_to :purchase
