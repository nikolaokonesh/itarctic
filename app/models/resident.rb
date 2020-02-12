class Resident < ApplicationRecord
  has_one_attached :photo
  validates :photo, blob: { content_type: :image, size_range: 1..5.megabytes }
  has_rich_text :body
  validates_presence_of :body
  validates :body, length: { maximum: 32_000 }
end
