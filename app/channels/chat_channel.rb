class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
  end

  def unsubscribed

  end

  def receive(data)
    ActionCable.server.broadcast(
      "chat_channel",
      {
        user_id: current_user.id,
        message: data
      }
    )
  end
end
