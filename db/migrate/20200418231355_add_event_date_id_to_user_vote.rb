class AddEventDateIdToUserVote < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_votes, :event_date, null: true, foreign_key: true
  end
end
