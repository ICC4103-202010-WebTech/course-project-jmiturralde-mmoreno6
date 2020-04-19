class CreateReceivedMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :received_messages do |t|
      t.string :sender_username
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
