class Partner < ApplicationRecord
  validates :url, url: { schemes: ['http', 'https'] }
  has_one_attached :photo
  validates :photo, blob: { content_type: :image, size_range: 1..5.megabytes }
end
