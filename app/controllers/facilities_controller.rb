class FacilitiesController < ApplicationController
  def new
    @facility = Facility.new
  end
  
  def show
    @facility = Facility.find(params[:id])
    p "@facilityの確認：：：：：：#{@facility}"
    @my_facilities = @facility.my_facilities.paginate(page: params[:page])
  end
  
  def create
    @facility = Facility.new(facility_params)
    if @facility.save
      flash[:success] = "登録に成功しました"
      redirect_to @facility
    else
      render 'new'
    end
  end
  
  private

    def facility_params
      params.require(:facility).permit(:name, :email, :phone_number,
                                       :password, :password_confirmation)
    end
end
