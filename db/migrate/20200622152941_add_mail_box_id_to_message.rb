class AddMailBoxIdToMessage < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :mail_box, null: true, foreign_key: true
  end
end
