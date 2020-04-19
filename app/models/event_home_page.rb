class EventHomePage < ApplicationRecord
  belongs_to :event
  has_many :image_event_pages
  has_many :video_event_pages
  has_many :pdf_event_pages
  has_many :comments
end
