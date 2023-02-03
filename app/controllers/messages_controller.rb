class MessagesController < ApplicationController
  skip_before_action  :authorize
  skip_before_action  :authorize_user
  before_action :set_chatroom
  include CurrentUser
  before_action :set_user

  def create
    message = @chatroom.messages.new(message_params)
    message.user = @cuser
    message.save
    redirect_to @chatroom
  end

  private
  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end