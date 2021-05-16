class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create]
  def index
    @my_facility = MyFacility.find(params[:my_facility_id])
    @reviews = @my_facility.reviews
  end
  
  def create
    @review = Review.new(review_params) 
    @review.user_id = current_user.id
    if @review.save
      redirect_back(fallback_location: root_path)
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