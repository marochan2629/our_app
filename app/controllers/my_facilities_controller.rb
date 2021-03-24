class MyFacilitiesController < ApplicationController
  before_action :logged_in_facility, only: [:create, :destroy]
  
  def show
    @my_facility = MyFacility.find(params[:id])
  end
  
  def new
    @my_facility = MyFacility.new
  end
    
  def create
    @my_facility = current_facility.my_facilities.build(my_facility_params)
    if @my_facility.save
      flash[:success] = "施設登録しました"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  private

    def my_facility_params
      params.permit(:facility_name, :branch_name, :kana, :category,
                                       :address, :phone_number, :email, :services, :top_image, 
                                       :other_image, :opening_days, :opening_hours, :access, 
                                       :parking_lot, :seats, :details)
    end
end
