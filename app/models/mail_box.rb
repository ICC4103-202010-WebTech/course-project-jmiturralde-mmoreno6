class MailBox < ApplicationRecord
  belongs_to :user
  has_many :received_messages
  has_many :send_messages
end
