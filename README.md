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
# user table   
|Column|Type|Option|   
| :--: | :--: | :--: |   
| nickname| string | NOT NULL |
| email | string | NOT NULL, unique: true |   
| password | string | NOT NULL |   
| first_name | string | NOT NULL |   
| list_name | string | NOT NULL |   
| first_name_kana | string | NOT NULL |   
| list_name_kana | string | NOT NULL |   
| birthday | text | NOT NULL |   


# items table   
|Column|Type|Option|   
| :--: | :--: | :--: |   
| item_name | string | NOT NULL |
| item description | text | NOT NULL |   
| detail_category | string | NOT NULL |   
| detail_condition | string | NOT NULL |   
| shipping_option | string | NOT NULL |   
| shipping_status | string | NOT NULL |   
| shipping_period | string | NOT NULL |   
| price | string | NOT NULL |   
| user_id | text | NOT NULL |   

# orders table   
|Column|Type|Option|   
| :--: | :--: | :--: |   
| item_id | string | NOT NULL |
| user_id | string | NOT NULL |   
| address_id | string | NOT NULL | 
| credit_card_id | string | NOT NULL | 

# addresses table
|Column|Type|Option|   
| :--: | :--: | :--: |   
| user_id | string | NOT NULL |
| postal_code | string | NOT NULL |   
| capital_city | string | NOT NULL | 
| city | string | NOT NULL | 
| street | string | NOT NULL | 
| apartment | string | NOT NULL | 
| phone_number | string | NOT NULL | 
