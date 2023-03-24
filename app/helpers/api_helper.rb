module ApiHelper

  def style_user_info(user)
    @inventory = user.user_inventory
    @wearing = user.user_wearing
    @money = user.user_money

    { user: {
        id: user.id,
        username: user.username,
        color: user.color,
        remember_token: user.remember_token,
        created_at: user.created_at,
        inventory: {
          glasses_3D: @inventory.glasses_3D,
        },
        wearing: {
          glasses_3D: @wearing.glasses_3D,
        },
        money: {
          quarters: @money.quarters,
          tickets: @money.tickets
        }
    } }
  end

end

# COLOR GUIDE
# "black" = 0
# "red" = 1
# etc
