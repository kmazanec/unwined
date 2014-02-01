FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    calendar

    trait :admin do
      admin true
    end
  end
  
end