class MyFacilitiesController < ApplicationController
  def show
    @my_facility = MyFacility.find(params[:id])
  end
  
  def new
    @my_facility = MyFacility.new
  end
    
  def create
    @my_facility = MyFacility.new(Myfacility_params)
    if @my_facility.save
      flash[:success] = "登録に成功しました"
      redirect_to @my_facility
    else
      render 'new'
    end
  end
end
