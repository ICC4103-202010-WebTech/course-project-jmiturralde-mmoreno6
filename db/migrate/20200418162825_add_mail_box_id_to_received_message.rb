class AddMailBoxIdToReceivedMessage < ActiveRecord::Migration[6.0]
  def change
    add_reference :received_messages, :mail_box, null: true, foreign_key: true
  end
end
