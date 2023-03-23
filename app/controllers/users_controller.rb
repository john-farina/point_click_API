class UsersController < Clearance::UsersController
  skip_before_action :verify_authenticity_token
  include ApiHelper

  def index
  end

  def show_signed_in
    # byebug

    if signed_in?
      @user = current_user

      render json: {signed_in: true, user: @user}, status: 200
    else
      render json: {signed_in: false}, status: 200
    end
  end

  def new
    @user = user_from_params

    render json: style_user_info(@user), status: 200
  end

  def create
    @user = user_from_params

    if @user.save
      sign_in @user

      @inventory = @user.build_user_inventory
      @wearing = @user.build_user_wearing
      @money = @user.build_user_money

      if @inventory.save && @wearing.save && @money.save
        render json: style_user_info(@user), status: 201
      end

    else
      render json: {method: "'create' Method"}, status: 400
    end
  end

  private

    def user_params
      params.permit(:email, :password)
    end
end
