class CreateVideoOrganizationPages < ActiveRecord::Migration[6.0]
  def change
    create_table :video_organization_pages do |t|
      t.string :video

      t.timestamps
    end
  end
end
