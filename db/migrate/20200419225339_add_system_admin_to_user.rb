class AddSystemAdminToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :system_admin, :boolean
  end
end
