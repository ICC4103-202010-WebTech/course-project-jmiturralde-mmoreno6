class AddEventInvitationIdToNotification < ActiveRecord::Migration[6.0]
  def change
    add_reference :notifications, :event_invitation, null: true, foreign_key: true
  end
end
