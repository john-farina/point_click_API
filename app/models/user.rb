class User < ApplicationRecord
  include Clearance::User

  has_one :user_inventory
  has_one :user_wearing
  has_one :user_money

  # includes (scene, x, y, online, etc.) will include messages in this way as well
  has_one :user_data
  has_many :messages

  has_one :position
end
