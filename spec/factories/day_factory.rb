FactoryGirl.define do
  factory :day do
    date Time.now.to_date
    comment Faker::Lorem.sentence
    calendar

    trait :sober do
      savings 10
      wine true
    end

    trait :drunk do
      savings (-15)
    end

  end
end