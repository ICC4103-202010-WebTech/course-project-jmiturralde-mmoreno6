class AddUserIdToEventInvitation < ActiveRecord::Migration[6.0]
  def change
    add_reference :event_invitations, :user, null: true, foreign_key: true
  end
end
