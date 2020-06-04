require 'securerandom'

include FactoryBot::Syntax::Methods
FactoryBot.define do
  factory :user do
    username { Faker::Name.first_name }
    email { "#{username.gsub(/\s+/, "")}.@example.com".downcase }
    system_admin {0}
    password {SecureRandom.alphanumeric(8)}

    factory :user_with_profile_page do
      transient do
        profile_pages_count { 1 }
      end

      after(:create) do |user, evaluator|
        create_list(:profile_page, evaluator.profile_pages_count, user: user)
      end
    end

  end

  factory :profile_page do
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    bio { Faker::ChuckNorris.fact }
    location { Faker::Address.country }
  end

  factory :mail_box do
    user { User.offset(rand(User.count)).first }
  end

  factory :event do
    title { Faker::Hipster.sentence }
    location {Faker::Address.city}
    description { Faker::ChuckNorris.fact }
    user { User.offset(rand(User.count)).first }
  end

  factory :organization do
    name { Faker::Superhero.name }
    description { Faker::ChuckNorris.fact }
    user { User.offset(rand(User.count)).first }
  end
end