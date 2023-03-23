class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  include ApiHelper

  def get_player_info
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])

      render json: style_user_info(@user), status: 200
    else
      if signed_in?
        @user = current_user

        render json: style_user_info(@user), status: 200
      else
        render json: {nothing: "nothing found ERROR"}, status: 400
      end
    end
  end

  # inventory = inv_itemname_descriptive
  # wearing = wear_itemname_descriptive

  def update_player_info
    if signed_in?
      @user = current_user
      @wearing = @user.user_wearing
      @inventory = @user.user_inventory
      @money = @user.user_money

      if params[:username]
        @user.username = params[:username]
      end

      if params[:color]
        @user.color = params[:color]
      end

      if params[:wear_glasses_3D]
        @wearing.glasses_3D = params[:wear_glasses_3D]
      end

      if params[:inv_glasses_3D]
        @inventory.glasses_3D = params[:inv_glasses_3D]
      end

      if params[:quarters]
        @money.quarters = params[:quarters]
      end

      if params[:tickets]
        @money.tickets = params[:tickets]
      end

      if @user.save && @wearing.save && @inventory.save && @money.save
        render json: style_user_info(@user), status: 201
      else
        render json: {error: "ERROR SAVING"}, status: 400
      end
    end
  end


end
