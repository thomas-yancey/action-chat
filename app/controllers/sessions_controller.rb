class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    #utilize bcrypts authenticate method to see if the password is correct
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      cookies.signed[:user_id] = session[:user_id]
      redirect_to rooms_path
    else
      @errors = @user.nil? ? ["username not found"] : ["Username and password do not match"]
      render "/sessions/new"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
