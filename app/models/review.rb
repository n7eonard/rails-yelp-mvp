class Review < ApplicationRecord
  belongs_to :restaurant
  # validates_associated :restaurant
  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5], message: "%{value} is not included between 0 and 5" }
end
