require 'redis'

class UsersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "UsersChannel"

    keys = redis.keys("userData:*")

    return nil unless keys.present?

    values = redis.mget(keys).each do |value|
      data = JSON.parse(value)

      ActionCable.server.broadcast("UsersChannel", {
        user_id: data["user_id"],
        data: data
        })
    end
  end

  def unsubscribed
    ActionCable.server.broadcast("UsersChannel", {
      user_id: current_user.id,
      data: nil
    })

    redis.del("userData:#{current_user.id}")
  end

  def disconnect
    redis.del("userData:#{current_user.id}")
  end

  def receive(data)
   new_data =  {
      user_id: current_user.id,
      username: data['username'],
      color: data['color'],
      online: data['online'],
      scene: data['scene'],
      x: data['x'],
      y: data['y'],
      mouse_x: data['mouse_x'],
      mouse_y: data['mouse_y'],
      rotation_index: data['rotation_index'],
      is_walking: data['is_walking'],
      glasses_3D: data['glasses_3D'],
      chain_gold: data['chain_gold']
   }

    ActionCable.server.broadcast("UsersChannel", {
      user_id: current_user.id,
      data: new_data
    })

    redis.set("userData:#{current_user.id}", new_data.to_json)
  end

  def get_all_users
    keys = redis.keys("userData:*")
    return [] unless key.present?

    values = redis.mget(keys).map { |value| JSON.parse(value) }

    values

    ActionCable.server.broadcast("UsersChannel", {
      all_users: values
    })
  end

  private
    def redis
      @redis ||= Redis.new(url: ENV.fetch("REDIS_URL"))
    end
end
