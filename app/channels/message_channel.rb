class MessageChannel < ApplicationCable::Channel
  def subscribed
    byebug

    stream_from "message"
  end

  def unsubscribed

  end

  def receive(data)
    byebug

    ActionCable.server.broadcast(
      "message",
      data
    )
  end
end
