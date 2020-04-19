class CreateSendMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :send_messages do |t|
      t.string :receiver_username
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
