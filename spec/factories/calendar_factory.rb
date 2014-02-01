FactoryGirl.define do
  factory :calendar do
    title Faker::Company.catch_phrase
    user

    factory :calendar_with_days do
      ignore do
        days_count 7
      end

      after(:create) do |calendar, evaluator|
        create_list(:day, evaluator.days_count, calendar: calendar)
      end
    end
  end

end