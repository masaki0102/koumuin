# README

# テーブル設計

## users テーブル

| Column      | Type   | Options                   |
| ----------- | ------ | ------------------------- |
| name        | string | null: false               |
| email       | string | null: false, unique: true |
| password    | string | null: false               |
| birth_date  | date   | null: false               |

### Association
- has_many :likes


## governments テーブル

| Column      | Type   | Options                   |
| ----------- | ------ | ------------------------- |
| name        | string | null: false               |
| email       | string | null: false, unique: true |
| password    | string | null: false               |

### Association
- has_many :exams



## exams テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| governments | references | null: false, foreign_key: true |
| category_id | integer    | null: false                    |
| date        | date       | null: false                    |
| age         | integer    | null: false                    |


### Association
- belongs_to :government
- has_many :likes



## likes テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| exam   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :exam
