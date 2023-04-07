class TypingChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'TypingChannel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    ActionCable.server.broadcast('TypingChannel', {
      user_id: current_user.id,
      data: data
    })
  end
end
