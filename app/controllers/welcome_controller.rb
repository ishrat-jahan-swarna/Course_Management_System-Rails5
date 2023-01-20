class WelcomeController < ApplicationController
  def index
    cadmin = Admin.find_by(id: session[:admin_id])
    @admin_name = cadmin.name
    @admin_email = cadmin.email

    @depts = Department.all
  end
end
