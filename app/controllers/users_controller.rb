class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      user_log_in @user
      flash[:success] = "登録に成功しました"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def show_favorite
    @user = User.find(params[:id])
    @my_facility = MyFacility.find(params[:id])

    favorites = Favorite.where(user_id: current_user.id).pluck(:my_facility_id)  # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    @favorite_list = MyFacility.find(favorites)     # postsテーブルから、お気に入り登録済みのレコードを取得
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    # beforeフィルター

    # 正しいユーザーかどうかを確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # 管理者かどうかを確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
