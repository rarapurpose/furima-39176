FactoryBot.define do

  factory :user do
    nickname {Faker::Name.initials} 
    email {Faker::Internet.unique.email} #free_email
    password {'1a'+ Faker::Internet.password(min_length: 6)} #'1a' 追加
    password_confirmation {password}
    #last_name {Faker::Name.initials}
    #first_name {Faker::Name.initials}
    last_name {"山田"}
    first_name {"太郎"}
    #last_name_kana {Faker::Name.initials}
    #first_name_kana {Faker::Name.initials}
    last_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    birthday {"2002-02-02"}
  end
end