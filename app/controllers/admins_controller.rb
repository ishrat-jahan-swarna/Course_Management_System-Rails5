class AdminsController < ApplicationController
  def index
    @admins = Admin.all
  end
  def new
    @admin = Admin.new
  end
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
        redirect to admins_path
    else
        render :new
    end
  end

  private
  def admin_params
    params.require(:admin).permit(:email, :name, :password)
  end
end
