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


## TABLE 
----
# users table   
|Column|Type|Option|   
| :--: | :--: | :--: |   
| nickname| string | null: false |
| email | string | null: false, unique: true |   
| encrypted_password | string | null: false |   
| first_name | string | null: false |   
| last_name | string | null: false |    
| first_name_kana | string | null: false |   
| last_name_kana | string | null: false |   
| birthday | date | null: false |   

 + has_many: items
 + has_many: orders
---

# items table   
|Column|Type|Option|   
| :--: | :--: | :--: |   
| item_name | string | null: false |
| item_description | text | null: false |   
| detail_category_id | integer | null: false |   
| detail_condition_id | integer | null: false |   
| shipping_option_id | integer | null: false |   
| shipping_prefecture_id | integer | null: false |   
| shipping_period_id | integer | null: false |  
| price | integer | null: false |   
| user | references | null: false,foreign_key:true  |   

+ belongs_to : user
+ has_one: order
+ belongs_to_active_hash :itemcategory
---

# orders table   
|Column|Type|Option|   
| :--: | :--: | :--: |   
| item | references | null: false,foreign_key:true |
| user | references | null: false,foreign_key:true |   

+ belongs_to : user
+ belongs_to : item
+ has_one : address
---

# addresses table
|Column|Type|Option|   
| :--: | :--: | :--: |   
| order | references | null: false,foreign_key:true |   
| postal_code | string | null: false |   
| shipping_prefecture_id | integer | null: false |
| city | string | null: false | 
| street | string | null: false | 
| apartment | string |
| phone_number | string | null: false | 

+ belongs_to : order 
  
# item category  
 belongs_to : item




 