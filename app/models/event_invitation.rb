class EventInvitation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :notifications
  has_one :user_vote
end
