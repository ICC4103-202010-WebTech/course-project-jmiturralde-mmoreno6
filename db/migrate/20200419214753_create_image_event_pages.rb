class CreateImageEventPages < ActiveRecord::Migration[6.0]
  def change
    create_table :image_event_pages do |t|
      t.string :image

      t.timestamps
    end
  end
end
