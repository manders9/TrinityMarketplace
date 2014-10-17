FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "person#{n}" }
    sequence(:email) { |n| "person#{n}@email.com" }
    password "abcd12345"
  end

  factory :user_book do
    title { Faker::Address.city + " " +  Faker::Commerce.color.capitalize }
    author { Faker::Name.first_name + " " + Faker::Name.last_name }
    condition "lightly used"
    price 5.00
    description { Faker::Lorem.sentence }
    status "for sale"
  end
end
