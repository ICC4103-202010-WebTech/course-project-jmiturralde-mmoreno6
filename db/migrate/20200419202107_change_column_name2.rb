class ChangeColumnName2 < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :minimun_guest, :minimum_guest
  end
end
