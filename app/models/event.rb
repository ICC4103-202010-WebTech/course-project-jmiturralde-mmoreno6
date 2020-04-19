class Event < ApplicationRecord
  belongs_to :event_creator
  belongs_to :organization, optional: true
  has_many :event_invitations
  has_many :users, :through => :event_invitations
  has_many :event_dates
  has_many :user_votes, :through => :event_dates
  has_one :event_home_page
  has_many :image_event_pages, :through => :event_home_page
  has_many :video_event_pages, :through => :event_home_page
  has_many :pdf_event_pages, :through => :event_home_page
  has_many :comments, :through => :event_home_page

  after_initialize :default_values

  private
  def default_values
    self.hidden ||= false
  end
end
