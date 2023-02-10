class RejectProfileMessagesController < ApplicationController
  skip_before_action  :authenticate_user!
  before_action :set_user

  def create
    reject_profile_message = RejectProfileMessage.new(reject_msg_params)
    reject_profile_message.user = @user
    reject_profile_message.save
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def reject_msg_params
    params.require(:reject_profile_message).permit(:body)
  end
end
