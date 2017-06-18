class FoodItem < ApplicationRecord
  belongs_to :section
  belongs_to :cuisine
  validates :name, :price, presence: true
  has_many :orders
  has_many :reviews

  def increment
    self.views ||= 0
    self.views += 1
    self.save
  end

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end

  def image_url_or_default
    image_url.presence || "http://loremflickr.com/320/240/#{name.gsub(' ','')}"
  end

  def self.get_menu_by_params(section_id, order_by, search, cuisine_id)
    if section_id
      food_items = Section.find(section_id).food_items
    else
      food_items = FoodItem.all
    end

    if cuisine_id
      food_items = food_items.where(cuisine_id: cuisine_id)
    end

    if search
      food_items = food_items.search(search)
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
