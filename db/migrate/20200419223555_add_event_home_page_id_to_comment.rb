class AddEventHomePageIdToComment < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :event_home_page, null: true, foreign_key: true
  end
end
