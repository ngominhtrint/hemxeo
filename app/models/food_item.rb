class FoodItem < ApplicationRecord
  belongs_to :section
  validates :name, :price, presence: true
  has_many :orders

  def image_url_or_default
    image_url.presence || "http://loremflickr.com/320/240/#{name.gsub(' ','')}"
  end

  def self.get_menu_by_params(section_id, order_by)
    if section_id
      food_items = Section.find(section_id).food_items
    else 
      food_items = FoodItem.all
    end

    case order_by
    when "asc"
      food_items.order(name: :asc)
    when "desc"
      food_items.order(name: :desc)
    when "price_asc"
      food_items.order(price: :asc)
    when "price_desc"
      food_items.order(price: :desc)
    else
      food_items
    end
  end
end
