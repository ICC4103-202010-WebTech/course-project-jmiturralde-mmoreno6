class CreateProfilePages < ActiveRecord::Migration[6.0]
  def change
    create_table :profile_pages do |t|
      t.string :picture
      t.string :name
      t.string :last_name
      t.string :bio
      t.string :location

      t.timestamps
    end
  end
end
