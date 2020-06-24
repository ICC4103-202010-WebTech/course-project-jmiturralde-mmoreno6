class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :receiver_username
      t.string :title
      t.string :boy

      t.timestamps
    end
  end
end
