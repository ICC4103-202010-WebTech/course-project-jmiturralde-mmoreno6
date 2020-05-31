class Comment < ApplicationRecord
  belongs_to :event_invitation
  belongs_to :event
  has_many :image_comments, :dependent => :destroy
  has_many :hyper_link_comments, :dependent => :destroy
end