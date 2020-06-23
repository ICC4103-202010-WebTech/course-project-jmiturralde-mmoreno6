require 'securerandom'

include FactoryBot::Syntax::Methods
FactoryBot.define do
  factory :message do
    receiver_username { "MyString" }
    title { "MyString" }
    boy { "MyString" }
  end

  factory :user do
    username { Faker::Name.first_name }
    email { "#{username.gsub(/\s+/, "")}@example.com".downcase }
    system_admin {0}
    password {SecureRandom.alphanumeric(8)}
    terms {true }
    after(:create) do |user|
      user.profile_page ||= create(:profile_page, :user => user)
      user.mail_box ||= create(:mail_box_with_messages, :user => user)
    end
  end

  factory :mail_box do
    #user
    factory :mail_box_with_messages do
      transient do
        send_messages_count { rand(1..6) }
        received_messages_count { rand(1..6) }
      end

      after(:create) do |mail_box, evaluator|
        create_list(:send_message, evaluator.send_messages_count, mail_box_id: mail_box.id)
        create_list(:received_message, evaluator.received_messages_count, mail_box_id: mail_box.id)
      end
    end

  end

  factory :send_message do
    title { Faker::Book.title }
    body { Faker::ChuckNorris.fact }
    receiver_username { User.offset(rand(User.count)).first.username }
  end

  factory :received_message do
    title { Faker::Book.title }
    body { Faker::ChuckNorris.fact }
    sender_username { User.offset(rand(User.count)).first.username }
  end

  factory :profile_page do
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    bio { Faker::Hacker.say_something_smart }
    location { Faker::Address.country }
  end


  factory :event do
    title { Faker::Restaurant.name }
    location {Faker::TvShows::Simpsons.location}
    description { Faker::TvShows::Simpsons.quote }
    user { User.offset(rand(User.count)).first }

    factory :event_with_event_invitations_and_comments do
      transient do
        event_invitations_count { rand(1..5)}
        comments_count {rand(1..6) }
      end

      after(:create) do |event, evaluator|
        create_list(:event_invitation, evaluator.event_invitations_count, event: event)
        create_list(:comment, evaluator.comments_count, event: event)
      end
    end
  end

  factory :event_invitation do
    user { User.offset(rand(User.count)).first }
  end

  factory :comment do
    content { Faker::ChuckNorris.fact }
    event_invitation { EventInvitation.offset(rand(EventInvitation.count)).first }

    before(:create) do |com|
      reply = Faker::Boolean.boolean(true_ratio: 0.5)
      if reply && (Comment.count > 0)
        com.commented_id ||= Comment.offset(rand(Comment.count)).first.id
      end
    end
  end

  factory :organization do
    name { Faker::Superhero.name }
    description { Faker::ChuckNorris.fact }
    user { User.offset(rand(User.count)).first }

    factory :organization_with_organization_invitations do
      transient do
        organization_invitations_count { rand(1..5) }
      end

      after(:create) do |organization, evaluator|
        create_list(:organization_invitation, evaluator.organization_invitations_count, organization: organization)
      end
    end
  end

  factory :organization_invitation do
    admin { Faker::Boolean.boolean(true_ratio: 0.3 )}
    user { User.offset(rand(User.count)).first }
  end
end