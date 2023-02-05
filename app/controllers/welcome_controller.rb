class WelcomeController < ApplicationController
  skip_before_action  :authenticate_user!
  def index
    if admin_signed_in?
      cadmin = current_admin
      @admin_name = cadmin.name
      @admin_email = cadmin.email

      @depts = Department.all
    end
  end
end
