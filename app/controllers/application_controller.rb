class ApplicationController < ActionController::Base
    before_action :authorize
    before_action :authorize_user

    protected
    
    def authorize
      unless Admin.find_by(id: session[:admin_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
    def authorize_user
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
end
