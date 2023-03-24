class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages"
  end

  def unsubscribed

  end

  def receive(data)
    data['user'] = current_user
    data['current_location'] = current_user.location

   # specific channel for the user's location
   stream_from "#{current_user.location}_messages"

   # send message to the specific channel for location
   ActionCable.server.broadcast(
     "#{current_user.location}_messages",
     data
   )
  end
end
