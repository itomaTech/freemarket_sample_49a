# README

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

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|not null, unique, index|
|mail-address|text|not null, unique|
|password|string|not null|
|password_confirm|string|not null|
|last_name|string|not null|
|first_name|string|not null|
|last_name_kana|string|not null|
|first_name_kana|string|not null|
|birth_year|integer|not null|
|birth_month|integer|not null|
|birth_day|integer|not null|
|phone_number|integer|

### Association
-has_one :address
-has_many :messages
-has_many :notieces
-has_one :addresses

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|zip-code|integer|not null|
|prefecture|string|not null|
|city|string|not null|
|block_number|text|not null|
|building_name|text|
|phone_number|integer|not null|
|user_id|integer|foreign_key :true|

### Association
-has_one :user

## high_rating_table
|Column|Type|Options|
|------|----|-------|
|send_user|integer|not null|
|received_user|integer|not null|

## middle_rating_table
|Column|Type|Options|
|------|----|-------|
|send_user|integer|not null|
|received_user|integer|not null|

## low_rating_table
|Column|Type|Options|
|------|----|-------|
|send_user|integer|not null|
|received_user|integer|not null|

## noticeテーブル
Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key :true|
|news|text|

### Association
-belongs_to :user

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|
|user_id|integer|foreign_key :true|

### Association
-belongs_to :user
-belongs_to :item

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|not null|
|category_id|integer|not null, foreign_key :ture|
|brand_id|integer|not null, foreign_key :true|
|size|string|
|condition|string|not null|
|price|integer|not null|
|image|text|not null|
|comment|text| 

### Association
-has_one :delivery
-has_many :genres
-has_many :brands
-has_many :categories

## deliveriesテーブル
|Column|Type|Options|
|------|----|-------|
|postage|integer|not null|
|send_type|string|not null|
|region|string|not null|
|require_data|string|not null|
|daftrayer|string| not null, unique|

### Association
-has_one :items
-has_one :order

## orderテーブル
Column|Type|Options|
|------|----|-------|
|item_id|integer|foreign_key :true|
|buyer_id|integer|foreing_key :true|
|seller_id|integer|foreign_key :true|

## todoテーブル
Column|Type|Options|
|------|----|-------|
|order_id|integer|foreign_key :true|
|buyer_id|integer|foreign_key :true|
|seller_id|integer|foreign_key :true|

## brnadsテーブル
Column|Type|Options|
|------|----|-------|
|name|string|not null, unique|
|genre_id|integer|foreign_key :true|
|categorory_id|integer|foreign_key :true|

## genresテーブル
Column|Type|Options|
|------|----|-------|
|name|string|not null|
|brand_id|integer|foreign_key :true|
|category_id|integer|foreign_key :true|

## categoriesテーブル
Column|Type|Options|
|------|----|-------|
|name|string|not null|
|genre_id|integer|foreign_key :true|
|brand_id|integer|foreign_key :true|
