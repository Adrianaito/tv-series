class Review < ApplicationRecord
  belongs_to :serie
  validates :content, presence: true
end
