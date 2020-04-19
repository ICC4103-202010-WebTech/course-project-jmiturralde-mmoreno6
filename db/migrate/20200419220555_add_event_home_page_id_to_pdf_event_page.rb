class AddEventHomePageIdToPdfEventPage < ActiveRecord::Migration[6.0]
  def change
    add_reference :pdf_event_pages, :event_home_page, null: true, foreign_key: true
  end
end
