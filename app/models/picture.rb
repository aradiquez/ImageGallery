class Picture < ApplicationRecord
  belongs_to :gallery
  has_one_attached :image

  validates :name, presence: true
  validates :image, presence: true
end
