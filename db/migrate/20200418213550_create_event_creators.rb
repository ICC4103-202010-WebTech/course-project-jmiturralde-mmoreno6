class CreateEventCreators < ActiveRecord::Migration[6.0]
  def change
    create_table :event_creators do |t|

      t.timestamps
    end
  end
end
