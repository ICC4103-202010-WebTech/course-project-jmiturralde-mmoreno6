class EventInvitation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_one :user_vote, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  after_initialize :default_values
  before_destroy :send_notification_event_delete

  private
  def default_values
    self.report ||= false
  end

  def send_notification_event_delete
    Notification.create(user: self.user, notification_type: 2)
  end

end
