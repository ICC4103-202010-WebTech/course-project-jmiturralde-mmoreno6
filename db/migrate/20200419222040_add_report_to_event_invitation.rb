class AddReportToEventInvitation < ActiveRecord::Migration[6.0]
  def change
    add_column :event_invitations, :report, :boolean
  end
end
