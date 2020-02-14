class Project < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 400 }
  validates :url, url: { schemes: ['http', 'https'] }
  has_rich_text :body
  validates_presence_of :body
  validates :body, length: { maximum: 32_000 }
  has_one_attached :photo
  validates :photo, blob: { content_type: :image, size_range: 1..5.megabytes }
  after_create :descript_create
  def descript_create
    update_attribute(:description, body.to_plain_text.to_s[0..200])
    save!
  end
end
