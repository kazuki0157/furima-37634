# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :comments
- has_one  :purchase_record

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| product_name     | string     | null: false                    |
| description      | text       | null: false                    |
| category         | string     | null: false                    |
| condition        | string     | null: false                    |
| pay_for_shipping | string     | null: false                    |
| shipping_area    | string     | null: false                    |
| shipping_days    | string     | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one  :purchase_record

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## purchase_records テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_number   | string     | null: false                    |
| expiration    | date       | null: false                    |
| security_code | integer    | null: false                    |
| zip           | string     | null: false                    |
| ken_name      | string     | null: false                    |
| city_name     | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     | null: true                     |
| tel           | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item