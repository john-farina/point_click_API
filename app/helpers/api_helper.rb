module ApiHelper

  def style_user_info(user)
    @inventory = user.user_inventory
    @wearing = user.user_wearing

    {user: {
        id: user.id,
        username: user.username,
        created_at: user.created_at,
        inventory: {
          glasses_3D: @inventory.glasses_3D,
        },
        wearing: {
          glasses_3D: @wearing.glasses_3D,
        }
    }}
  end

end
