class Comment < ApplicationRecord
  belongs_to :event_invitation
  belongs_to :event
  has_many_attached :comment_images
end
