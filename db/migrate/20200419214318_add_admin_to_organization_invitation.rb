class AddAdminToOrganizationInvitation < ActiveRecord::Migration[6.0]
  def change
    add_column :organization_invitations, :admin, :boolean
  end
end
