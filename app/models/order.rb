class Order < ApplicationRecord
  belongs_to :food_item
  validates :quantity, presence: true, numericality: true

  def total_price
    food_item.price * self.quantity + 20000
  end

end
