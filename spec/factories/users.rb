FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user-#{n}" }
    sequence(:email) { |n| "user-email-#{n}" }
    password { 'password' }
    password_confirmation { 'password' }
    role { :admin }

    trait :admin do
      sequence(:name) { |n| "admin-#{n}" }
      role { :admin }
    end

    trait :general do
      sequence(:name) { |n| "general-#{n}" }
      role { :general }
    end
  end
end
