class UserVote < ApplicationRecord
  belongs_to :event_invitation
  belongs_to :event_date
end
