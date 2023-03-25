class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "ChatChannel"
  end

  def unsubscribed

  end

  def receive(data)
    ActionCable.server.broadcast(
      "ChatChannel",
      data
    )
  end
end
