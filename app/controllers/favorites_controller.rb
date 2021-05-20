class FavoritesController < ApplicationController
  # before_action :set_my_facility
  before_action :logged_in_user
  # belongs_to :user
  # belongs_to :my_facility
  

  def create
    my_facility = MyFacility.find(params[:my_facility_id])
    current_user.add_favorite(my_facility)
    flash[:success] = "お気に入りに追加しました"
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    my_facility = MyFacility.find(params[:my_facility_id])
    current_user.remove_favorite(my_facility)
    flash[:success] = "お気に入りから削除しました"
    redirect_back(fallback_location: root_path)
  end
end
