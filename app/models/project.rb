class Project < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 400 }
  validates :url, url: { schemes: ['https'] }
  has_rich_text :body
  validates_presence_of :body
  validates :body, length: { maximum: 32_000 }
end
