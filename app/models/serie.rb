class Serie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :title, presence: true
  has_one_attached :photo
  validates :photo, presence: true
end
