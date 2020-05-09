class AddDataToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :title, :string
    add_column :events, :description, :string
    add_column :events, :banner_picture, :string
  end
end
