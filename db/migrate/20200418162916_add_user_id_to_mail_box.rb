class AddUserIdToMailBox < ActiveRecord::Migration[6.0]
  def change
    add_reference :mail_boxes, :user, null: true, foreign_key: true
  end
end
