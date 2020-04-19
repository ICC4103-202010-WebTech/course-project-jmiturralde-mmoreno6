class AddUserIdToProfilePage < ActiveRecord::Migration[6.0]
  def change
    add_reference :profile_pages, :user, null: true, foreign_key: true
  end
end
