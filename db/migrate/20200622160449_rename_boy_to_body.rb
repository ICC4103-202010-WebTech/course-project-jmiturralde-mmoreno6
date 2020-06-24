class RenameBoyToBody < ActiveRecord::Migration[6.0]
  def change
    rename_column :messages, :boy, :body
  end
end
