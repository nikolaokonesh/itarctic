class User < ApplicationRecord
  has_person_name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable #, :confirmable

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates_length_of :first_name,
                      minimum: 1,
                      maximum: 50

  validates_length_of :last_name,
                      minimum: 1,
                      maximum: 50

  def username
    name.familiar.mb_chars.titleize
  end

  def name_full
    name.full.mb_chars.titleize
  end
end
