class ReviewsController < ApplicationController
  def index
  end
  
  def create
    @review = Review.new(review_params) 
    @review.user_id = current_user.id
    if @review.save
      redirect_to my_facilities_path(@review.my_facility)
    else
      @my_facility = MyFacility.find(params[:id])
      render "my_facilities/show"
    end
  end
  
  private
   def review_params
     params.require(:review).permit(:my_facility_id, :score, :content)
   end
end