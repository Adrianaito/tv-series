class Serie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :title, presence: true
  validates :rating, presence: true
  has_one_attached :photo
end
