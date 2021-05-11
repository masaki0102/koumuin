# アプリケーション名
  公務員試験net
 
# アプリケーション概要
  地方公務員を目指す人のためのWebメディア
  試験の情報を収集することができる
 
# URL
  https://koumuin-shiken.net/
  http://54.150.146.25/
 
# テスト用アカウント
| Column   | value         |
| -------- | ------------- |
| Email    | test@test.com |
| Password | testman       | 

# 利用方法
- トップページ上の「ログイン・新規登録」または「ゲストログイン」ボタンよりログインする
- 条件またはエリア・都道府県から試験の情報を検索することができる
- 検索結果のページ上の星マークをクリックしてお気に入りに登録できる
- 検索結果のページから遷移して試験の詳細情報を閲覧できる
  
# 目指した課題解決
- 公務員を目指す受験生が効率的に公務員試験の情報収集・管理を行えるようにする
- 職員を募集する自治体が試験の概要を広く周知できるようにする

# データベース設計

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

| Column        | Type    | Options                   |
| ------------- | ------- | ------------------------- |
| name          | string  | null: false               |
| prefecture_id | integer | null: false               |
| email         | string  | null: false, unique: true |
| password      | string  | null: false               |

### Association
- has_many :exams



## exams テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| governments | references | null: false, foreign_key: true |
| category_id | integer    | null: false                    |
| date        | date       | null: false                    |
| age         | integer    | null: false                    |
| capacity    | string     | null: false                    |


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
