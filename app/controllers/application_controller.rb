class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :member_of_group

  def current_user
    return unless session[:user]
    @current_user ||= User.find(session[:user])
  end

  def logged_in?
    !!session[:user]
  end

  def member_of_group
    !!@room.memberships.find_by(user_id: current_user.id)
  end

end
