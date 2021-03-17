class MyFacilitiesController < ApplicationController
  def show
    @my_facility = MyFacility.find(params[:id])
  end
  
  def new
    @my_facility = MyFacility.new
  end
    
  def create
    @my_facility = MyFacility.new(my_facility_params)
    if @my_facility.save
      flash[:success] = "登録に成功しました"
      redirect_to @my_facility
    # else
    #   render 'new'
    end
  end
  
  private

    def my_facility_params
      params.require(:my_facility).permit(:facility_name, :branch_name, :kana, :category,
                                       :address, :phone_number, :email, :services, :top_image, 
                                       :other_image, :opening_days, :opening_hours, :access, 
                                       :parking_lot, :seats, :details)
    end
end
