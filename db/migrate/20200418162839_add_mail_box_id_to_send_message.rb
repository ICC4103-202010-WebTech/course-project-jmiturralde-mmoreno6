class AddMailBoxIdToSendMessage < ActiveRecord::Migration[6.0]
  def change
    add_reference :send_messages, :mail_box, null: true, foreign_key: true
  end
end
