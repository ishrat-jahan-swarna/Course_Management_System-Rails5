class ChatroomUsersController < ApplicationController
  skip_before_action  :authorize
  before_action :set_chatroom
  include CurrentUser
  before_action :set_user

  def create
    @chatroom_user = @chatroom.chatroom_users.where(user_id: @cuser.id).first_or_create
    redirect_to @chatroom
  end

  def destroy
    @chatroom_user = @chatroom.chatroom_users.where(user_id: @cuser.id).destroy_all
    redirect_to chatrooms_path
  end

  private 
  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end
end
