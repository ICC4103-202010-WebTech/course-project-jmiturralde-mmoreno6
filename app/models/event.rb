class Event < ApplicationRecord
  belongs_to :organization, optional: true
  belongs_to :user
  has_many :event_invitations
  has_many :users, :through => :event_invitations
  has_many :event_dates
  has_many :user_votes, :through => :event_dates
  has_many :image_event_pages
  has_many :video_event_pages
  has_many :pdf_event_pages
  has_many :comments

  after_initialize :default_values

  private
  def default_values
    self.hidden ||= false
  end
end
