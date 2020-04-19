class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :calendar
      t.integer :type

      t.timestamps
    end
  end
end
