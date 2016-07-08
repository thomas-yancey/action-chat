class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      cookies.signed[:user_id] = session[:user_id]
      @user.rooms << Room.find(1)
      redirect_to rooms_path
    else
      @errors = @user.errors.full_messages
      render "/users/new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
