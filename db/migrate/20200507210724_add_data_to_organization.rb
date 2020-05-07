class AddDataToOrganization < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :name, :string
    add_column :organizations, :description, :string
    add_column :organizations, :banner_picture, :string
  end
end
