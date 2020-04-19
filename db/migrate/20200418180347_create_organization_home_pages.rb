class CreateOrganizationHomePages < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_home_pages do |t|
      t.string :name
      t.string :description
      t.string :banner_picture

      t.timestamps
    end
  end
end
