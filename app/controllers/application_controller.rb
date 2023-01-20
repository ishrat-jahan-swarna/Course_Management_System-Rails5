class ApplicationController < ActionController::Base
    before_action :authorize

    protected
    
    def authorize
      unless Admin.find_by(id: session[:admin_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
end
