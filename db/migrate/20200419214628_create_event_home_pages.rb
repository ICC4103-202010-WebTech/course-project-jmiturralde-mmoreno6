class CreateEventHomePages < ActiveRecord::Migration[6.0]
  def change
    create_table :event_home_pages do |t|
      t.string :banner_picture
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
