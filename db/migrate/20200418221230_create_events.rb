class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :location
      t.integer :minimun_guest
      t.datetime :start_event_date_vote
      t.boolean :event_rule
      t.boolean :hidden

      t.timestamps
    end
  end
end
