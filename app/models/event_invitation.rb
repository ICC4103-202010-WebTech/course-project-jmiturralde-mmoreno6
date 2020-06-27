class EventInvitation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_one :user_vote, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  after_initialize :default_values
  before_destroy :send_notification_event_delete
  after_create :send_notification_event_create
  before_update :check_report_event, :if => :report_changed?

  private
  def default_values
    self.report ||= false
  end

  def send_notification_event_create
    Notification.create(user: self.user, notification_type: 0)
  end

  def send_notification_event_delete
    Notification.create(user: self.user, notification_type: 2)
  end

  def check_report_event
    reports_count = EventInvitation.where(event_id: self.event_id, report: true).count
    if reports_count >= 1
      Event.destroy(self.event_id)
    end
  end

end
