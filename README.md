# README

# アプリケーション名
  公務員試験net
 
# アプリケーション概要
  公務員試験の情報収集を行える
 
# URL
  http://54.150.146.25/
 
# テスト用アカウント
  Email     test@test.com
  Password  testman
 
# 利用方法
  ・トップページ上の「受験生の方 ログイン・新規登録」ボタンよりテスト用アカウントでログインする
  ・試験情報を閲覧したい自治体をクリックする
  ・試験情報の星マークをクリックしてお気に入りに登録する
  
# 目指した課題解決
  公務員を目指す受験生が手軽に公務員試験の情報収集を行えるようにする
  職員を募集する自治体が試験の概要を広く周知できるようにする

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
