FactoryGirl.define do
  factory :member do
    sequence(:user_id) { |n| n + 1 }
    sequence(:name) { |n| "Taro#{n}" }
    sequence(:phone_number) { |n| "0901234567#{n}" }
    sequence(:email) { |n| "taro#{n}@email.com" }
    password "password"
    password_confirmation "password"
  end
end

