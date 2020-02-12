class Rekvisit < ApplicationRecord
  has_rich_text :body
  validates_presence_of :body
  validates :body, length: { maximum: 32_000 }
end
