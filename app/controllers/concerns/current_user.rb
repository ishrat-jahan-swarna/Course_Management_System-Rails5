module CurrentUser
    private
        def set_user
            @cuser = User.find_by(id: session[:user_id])
        rescue ActiveRecord::RecordNotFound
            redirect_to login_url
        end
end