class CreateVideoEventPages < ActiveRecord::Migration[6.0]
  def change
    create_table :video_event_pages do |t|
      t.string :video

      t.timestamps
    end
  end
end
