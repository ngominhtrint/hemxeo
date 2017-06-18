class RemoveCuisineFromFoodItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :food_items, :cuisine, :string
  end
end
