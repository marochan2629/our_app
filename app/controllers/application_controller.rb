class ApplicationController < ActionController::Base
  include SessionsHelper
  
  private

    # ユーザーのログインを確認する
    def logged_in_user
      unless user_logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # 施設管理ユーザーのログインを確認する
    def logged_in_facility
      unless facility_logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to facilities_login_url
      end
    end
end