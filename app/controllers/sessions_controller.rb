class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      flash[:notice] = "Welcome #{user.name}, you are logged in!"
    else
      flash[:notice] = "Login failed"
    end

    redirect_to users_path
  end
end