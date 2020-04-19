class CreateOrganizationCreators < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_creators do |t|

      t.timestamps
    end
  end
end
