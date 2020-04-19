class AddEventHomePageIdToImageEventPage < ActiveRecord::Migration[6.0]
  def change
    add_reference :image_event_pages, :event_home_page, null: true, foreign_key: true
  end
end
