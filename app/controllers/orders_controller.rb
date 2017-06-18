class OrdersController < ApplicationController

  def new
    @item = FoodItem.find(params[:food_item_id])
    @order = @item.orders.build
  end

  def create
    @item = FoodItem.find(params[:food_item_id])
    @order = @item.orders.build order_params

    if @order.save
      redirect_to "/food_items/#{@order.food_item_id}/orders/#{@order.id}", flash: {success: "Thank you for your order" }
    else
      render 'new'
    end
  end

  def show
    @order = Order.find(params[:id])
    @total_price = @order.total_price
  end

  def order_params
    params.require(:order).permit(:quantity, :name, :phone_number, :address)
  end

end
