class CreateEventInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :event_invitations do |t|

      t.timestamps
    end
  end
end
