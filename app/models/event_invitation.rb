class EventInvitation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :notifications
  has_one :user_vote
  has_many :comments

  after_initialize :default_values
  private
  def default_values
    self.report ||= false
  end
end
