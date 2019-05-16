class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    session = Session.new(session_params)
    if session.save && user = User.authenticate(session_params[:email], session_params[:password])
      flash[:notice] = "Welcome #{user.name}, you are logged in!"
    else
      flash[:notice] = "Login failed"
    end

    redirect_to users_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end