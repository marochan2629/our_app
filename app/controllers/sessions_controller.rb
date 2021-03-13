class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      user_log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def facilities_create
    facility = Facility.find_by(email: params[:session][:email].downcase)
    if facility&.authenticate(params[:session][:password])
      facility_log_in facility
      redirect_to facility
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'facilities_new'
    end
  end

  def user_destroy
    user_log_out
    redirect_to root_url
  end
  
  def facility_destroy
    facility_log_out
    redirect_to root_url
  end
end
