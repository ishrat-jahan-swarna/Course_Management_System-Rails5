class WelcomeStudentController < ApplicationController
  before_action :authorize_user
  skip_before_action  :authorize
  def index
    cuser = User.find_by(id: session[:user_id])
    @user_name = cuser.name
    @user_email = cuser.email
    
  end
end
