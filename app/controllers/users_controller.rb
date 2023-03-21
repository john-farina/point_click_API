class UsersController < Clearance::UsersController
  skip_before_action :verify_authenticity_token


  def hello
    
  end

  def index 
  end

  def show_signed_in
    # byebug

    if signed_in?
      @user = current_user

      render json: {signed_in: true, user: @user}
    else
      render json: {signed_in: false}
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
      render json: {method: "'create' Method", didnt_work: true}
    end
  end

  private

    def user_params
      params.permit(:email, :password)

      # params[Clearance.configuration.user_parameter] || Hash.new
    end
end
