class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "ChatChannel"
  end

  def unsubscribed

  end

  def receive(data)
    ActionCable.server.broadcast(
      "ChatChannel",
      {
        user_id: current_user.id,
        message: data
      }

    )
  end
end
