class Event < ApplicationRecord
  belongs_to :event_creator
  belongs_to :organization, optional: true
  has_many :event_invitations
  has_many :users, :through => :event_invitations
  has_many :event_dates
end
