class Gallery < ApplicationRecord
  has_many :pictures, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :author, presence: true
end
