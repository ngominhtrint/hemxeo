class Review < ApplicationRecord
  belongs_to :food_item
  validates :rate, presence: true, numericality: true
end
