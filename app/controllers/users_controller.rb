class UsersController < ApplicationController
  # before_action :require_login, only: :secret

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    User.create(user_params)

    redirect_to users_path
  end

  def secret
    if !session[:current_user_email]
      redirect_to "/login"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  # def require_login
  #   session[:current_user_email]
  # end
end