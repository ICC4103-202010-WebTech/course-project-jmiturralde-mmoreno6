class AddEventIdToNotification < ActiveRecord::Migration[6.0]
  def change
    add_reference :notifications, :event, null: true, foreign_key: false
  end
end
