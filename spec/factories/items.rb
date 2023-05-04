FactoryBot.define do
  
  factory :item do
    item_name {Faker::Name.initials} 
    item_description {Faker::Lorem.sentence} 
    detail_category_id {Faker::Number.between(from: 1, to: 10)} 
    detail_condition_id {Faker::Number.between(from: 1, to: 6)} 
    shipping_option_id {Faker::Number.between(from: 1, to: 2)} 
    shipping_prefecture_id {Faker::Number.between(from: 1, to: 47)} 
    shipping_period_id {Faker::Number.between(from: 1, to: 3)} 
    price {Faker::Number.between(from: 300, to: 9_999_999)} 
    
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
