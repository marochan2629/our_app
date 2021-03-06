module SessionsHelper
  # 渡されたユーザーでログインする
  def user_log_in(user)
    session[:user_id] = user.id
  end
  
  def facility_log_in(facilty)
    session[:user_id] = user.id
  end
  
  # 現在ログイン中のユーザーを返す（いる場合）
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
  def current_facility
    if session[:facility_id]
      @current_facility ||= Facility.find_by(id: session[:user_id])
    end
  end
  
  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def user_logged_in?
    !current_user.nil?
  end
  
  def facility_logged_in?
    !current_facility.nil?
  end
  
   # 現在のユーザーをログアウトする
  def user_log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  def facility_log_out
    session.delete(:facility_id)
    @current_facility = nil
  end
end
