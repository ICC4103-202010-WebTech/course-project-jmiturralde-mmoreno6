class Event < ApplicationRecord
  belongs_to :organization, optional: true
  belongs_to :user
  has_many :event_invitations, :dependent => :destroy
  has_many :users, :through => :event_invitations
  has_many :event_dates, :dependent => :destroy
  has_many :user_votes, :through => :event_dates
  has_many :comments, :dependent => :destroy
  has_one_attached :event_picture
  has_many_attached :documents
  has_many_attached :videos
  has_many_attached :images
  accepts_nested_attributes_for :event_invitations, allow_destroy: true

  after_initialize :default_values
  before_update :send_notification, :if => :start_event_date_vote_changed?


  private
  def default_values
    self.hidden ||= false
  end

  def send_notification
    self.event_invitations.each do |invitation|
      Notification.create(user_id: invitation.user_id, notification_type: 1, event_id: self.id)
    end
  end

end
