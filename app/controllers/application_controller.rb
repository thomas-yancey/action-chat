class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :member_of_group, :verified_log_in, :redirect_with_flash

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def verify_logged_in
    unless logged_in?
      flash[:notice] = "You must be logged in to view that page"
      redirect_to root_path
    end
  end

  def member_of_group
    !!@room.memberships.find_by(user_id: current_user.id)
  end

  def redirect_with_flash
    flash[:notice] = "You are not a member of that room"
    redirect_to root_path
  end

end
