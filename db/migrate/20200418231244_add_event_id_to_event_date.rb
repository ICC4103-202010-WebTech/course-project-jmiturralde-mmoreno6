class AddEventIdToEventDate < ActiveRecord::Migration[6.0]
  def change
    add_reference :event_dates, :event, null: true, foreign_key: true
  end
end
