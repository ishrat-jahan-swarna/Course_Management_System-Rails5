class RejectProfileMessagesController < ApplicationController
  skip_before_action  :authenticate_user!
  before_action :set_user

  def new
    puts @user
    @reject_profile_message = @user.reject_profile_messages.new
  end

  def create
    @user.reject_profile_messages.delete_all
    @reject_profile_message = @user.reject_profile_messages.new(reject_msg_params)
    @reject_profile_message.save!
    @user.user_profile.checked = true
    redirect_to @user
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def reject_msg_params
    params.require(:reject_profile_message).permit(:body)
  end
end
