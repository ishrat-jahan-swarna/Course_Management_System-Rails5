class SessionsController < ApplicationController
  skip_before_action  :authorize
  skip_before_action  :authorize_user
  
  def new
  end

  def new_user
  end

  def create
    admin = Admin.find_by(email: params[:email])
    user = User.find_by(email: params[:email])
    if admin&.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to welcome_index_url
    elsif user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to welcome_student_index_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to first_index_url, notice: "Logged out"
  end

  def destroy_user
    session[:user_id] = nil
    redirect_to first_index_url, notice: "Logged out"
  end
end
