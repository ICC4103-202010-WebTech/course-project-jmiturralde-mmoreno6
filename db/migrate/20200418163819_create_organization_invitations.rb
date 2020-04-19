class CreateOrganizationInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_invitations do |t|

      t.timestamps
    end
  end
end
