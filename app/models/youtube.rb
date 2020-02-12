class Youtube < ApplicationRecord
  validates :url, url: { schemes: ['https'] }

  belongs_to :commentable, polymorphic: true, touch: true

  def uid
    url.to_s[-11..-1]
  end
end
