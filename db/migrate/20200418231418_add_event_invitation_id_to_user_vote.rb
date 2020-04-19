class AddEventInvitationIdToUserVote < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_votes, :event_invitation, null: true, foreign_key: true
  end
end
