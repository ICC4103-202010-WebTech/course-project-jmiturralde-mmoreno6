class AddEventIdToImageEventPage < ActiveRecord::Migration[6.0]
  def change
    add_reference :image_event_pages, :event, null: true, foreign_key: true
  end
end
