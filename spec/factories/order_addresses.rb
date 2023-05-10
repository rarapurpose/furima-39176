FactoryBot.define do
  factory :order_address do    
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
    postal_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }     
    shipping_prefecture_id {Faker::Number.between(from: 1, to: 47)} 
    city { Faker::Address.city }   
    street { Faker::Address.street_address }
    apartment { Faker::Address.street_address }
    phone_number { Faker::Number.decimal_part(digits: 11) }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
    
    
  end
end
