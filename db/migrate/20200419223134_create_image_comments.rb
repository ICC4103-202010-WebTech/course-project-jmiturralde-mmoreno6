class CreateImageComments < ActiveRecord::Migration[6.0]
  def change
    create_table :image_comments do |t|
      t.string :image

      t.timestamps
    end
  end
end
