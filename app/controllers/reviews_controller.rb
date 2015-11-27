class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    unless current_user == nil
      @review.restaurant_id = @restaurant.id
      @review.user_id = current_user.id
      if @review.save
        redirect_to restaurants_path
      else
        flash[:notice] = 'You can leave only one review per restaurant'
        redirect_to '/restaurants'
      end
    else
      flash[:notice] = 'You have to log in firts'
      redirect_to '/restaurants'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    unless current_user == nil
      if @review.user_id == current_user.id
        @review.destroy
        flash[:notice] = 'Review deleted successfully'
      else
        flash[:notice] = 'You did not create this review'
      end
    else
      flash[:notice] = 'You did not create this review'
    end
    redirect_to '/restaurants'
  end

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end
end
