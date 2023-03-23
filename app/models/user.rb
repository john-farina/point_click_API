class User < ApplicationRecord
  include Clearance::User

  has_one :user_inventory
  has_one :user_wearing
end
