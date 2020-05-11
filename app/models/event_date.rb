class EventDate < ApplicationRecord
  belongs_to :event
  has_many :user_votes, :dependent => :destroy
end
