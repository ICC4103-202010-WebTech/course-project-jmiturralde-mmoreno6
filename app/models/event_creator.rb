class EventCreator < ApplicationRecord
  belongs_to :user
  has_one :event
end
