class ViewCountChannel < ApplicationCable::Channel
  def subscribed
    stream_from "view_count"
    ActionCable.server.broadcast "view_count", { count: ActionCable.server.connections.length }
  end

  def unsubscribed
    ActionCable.server.broadcast "view_count", { count: ActionCable.server.connections.length }
  end
end
