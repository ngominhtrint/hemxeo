class ReviewsController < ApplicationController

  def new
    @item = FoodItem.find(params[:food_item_id])
    @review = @item.reviews.build
  end

  def create
    @item = FoodItem.find(params[:food_item_id])
    @review = @item.reviews.build review_params

    if @review.save
      redirect_to "/food_items/#{@review.food_item_id}/reviews/#{@review.id}", flash: {success: "Thank you for your review" }
    else
      render 'new'
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rate, :comment)
  end

end
