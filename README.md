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

## users

|Column                |Type  |Options   |
|----------------------|------|----------|
|name                  |string|null:false|
|encrypted_confirmation|string|null:false|
|firstname             |string|null:false|
|lastname              |string|null:false|
|firstname_kana        |string|null:false|
|lastname_kana         |string|null:false|
|date                  |string|null:false|


### Association

- has_many :items
- has_many :purchases

## items

|Column      |Type  |Options          |
|------------|------|-----------------|
|items_name  |string|null:false       |
|explanation |string|null:false       |
|category    |string|null:false       |
|status      |string|null:false       |
|delivery fee|string|null:false       |
|area        |string|null:false       |
|days        |string|null:false       |
|price       |string|null:false       |
|user_id     |string|foreign_key: true|

### Association

belongs_to :user
has_one :purchase

## purchase

|Column     |Type   |Options          |
|-----------|-------|-----------------|
|card       |string |null:false       |
|expiration |string |null:false       |
|cvc        |string |null:false       |
|user_id    |integer|foreign_key: true|
|items_id   |integer|foreign_key: true|

### Association

belongs_to :item
has_one :address
belongs_to :user

## address

|Column      |Type   |Options          |
|------------|-------|-----------------|
|postal_code |string |null:false       |
|prefectures |string |null:false       |
|municipality|string |null:false       |
|address     |string |null:false       |
|building    |string |null:false       |
|tel         |string |null:false       |
|purchase_id |integer|foreign_key: true|

### Association

belongs_to :purchase
