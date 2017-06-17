class HomeController < ApplicationController
  def index
  end

  def menu
    @sections = Section.all
    @food_items = FoodItem.get_menu_by_params(params[:section_id], params[:order_by])
  end

  def contact_us
  end
end
