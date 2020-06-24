class AddColumnTermsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :terms, :boolean
  end
end
