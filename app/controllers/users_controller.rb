class UsersController < Clearance::UsersController
  skip_before_action :verify_authenticity_token


  def hello
    render json: "hello world"
  end

  def show_signed_in
    if signed_in?
      render json: {yes: "Signed in", remember_token: cookies[:remember_token]}
    else
      render json: "Signed Out"
    end
  end

  def new
    @user = user_from_params

    render json: {user: @user, remember_token: cookies[:remember_token]}
  end

  def create
    @user = user_from_params
    # byebug
    if @user.save
      sign_in @user

      render json: {user: @user, remember_token: cookies[:remember_token]}
    else
      render json: "didnt work"
    end
  end

  private

    def user_params
      params.permit(:email, :password)

      # params[Clearance.configuration.user_parameter] || Hash.new
    end
end
