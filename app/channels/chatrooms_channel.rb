class ChatroomsChannel < ApplicationCable::Channel
  def subscribed
    current_user.chatrooms.each do |chatroom|
      stream_from "chatrooms:#{chatroom.id}"
    end
    puts "subcribed"
  end

  def unsubscribed
    stop_all_streams
  end

  def send_message(data)
    puts "I am in send_message"
    @chatroom = Chatroom.find(data["chatroom_id"])
    message   = @chatroom.messages.create(body: data["body"], user_id: current_user.id)
    MessageRelayJob.perform_later(message)
  end
end
