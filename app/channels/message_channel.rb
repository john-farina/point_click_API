class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    data['user'] = current_user

    ActionCable.server.broadcast(
      current_user.location + "_messages",
      data
    )
  end
end
