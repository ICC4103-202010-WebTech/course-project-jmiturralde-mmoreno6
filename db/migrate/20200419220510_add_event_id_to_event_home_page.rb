class AddEventIdToEventHomePage < ActiveRecord::Migration[6.0]
  def change
    add_reference :event_home_pages, :event, null: true, foreign_key: true
  end
end
