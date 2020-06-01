class Event < ApplicationRecord
  belongs_to :organization, optional: true
  belongs_to :user
  has_many :event_invitations, :dependent => :destroy
  has_many :users, :through => :event_invitations
  has_many :event_dates, :dependent => :destroy
  has_many :user_votes, :through => :event_dates
  has_many :image_event_pages, :dependent => :destroy
  has_many :video_event_pages, :dependent => :destroy
  has_many :pdf_event_pages, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_one_attached :event_picture
  has_many_attached :documents
  has_many_attached :videos
  has_many_attached :images
  accepts_nested_attributes_for :event_invitations, allow_destroy: true

  after_initialize :default_values

  private
  def default_values
    self.hidden ||= false
  end

end
