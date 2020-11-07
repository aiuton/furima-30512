# DB設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nick_name          | string              | null: false             |
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |
| first_name_kana    | string              | null: false             |
| family_name_kana   | string              | null: false             |
| first_name         | string              | null: false             |
| family_name        | string              | null: false             |
| birth_day          | date                | null: false             |

### Association

* has_many :items dependent:destroy
* has_many :order dependent:destroy

## items table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user               | references          | foreign_key: true       |
| title              | string              | null: false             |
| description        | text                | null: false             |
| price              | integer             | null: false             |
| condition_id       | integer             | null: false             |
| shipping_cost_id   | integer             | null: false             |
| shipping_days_id   | integer             | null: false             |
| prefecture_id      | integer             | null: false             |
| category_id        | integer             | null: false             |

### Association

* has_one :order
* belongs_to :user


## order table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user               | references          | foreign_key: true       |
| item               | references          | foreign_key: true       |

### Association

* has_one :destination
* belongs_to :item
* belongs_to :user

## destinations table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| history            | references          | foreign_key: true       || postcode           | string              | null: false             |
| prefecture_id      | integer             | null: false             |
| city               | string              | null: false             |
| street_address     | string              | null: false             |
| building_name      | string              |                         |
| phone_number       | string              | null: false             |

### Association

* belongs_to :order