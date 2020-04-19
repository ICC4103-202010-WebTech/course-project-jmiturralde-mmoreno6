class AddEventCreatorIdToEvent < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :event_creator, null: true, foreign_key: true
  end
end
