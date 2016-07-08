class MembershipsController < ApplicationController
  before_action :verify_logged_in

  def index
    @room = Room.find(params[:room_id])
    redirect_with_flash unless member_of_group
    @memberships = Membership.where(room_id: params[:room_id])
    @users = User.where.not(id: @memberships.pluck(:user_id))
  end

  def create
    @room = Room.find(params[:room_id])
    redirect_with_flash unless member_of_group

    user = User.find(params[:user_id])
    membership = Membership.new(user_id: user.id, room_id: @room.id)
    if membership.save
      render plain: JSON.generate({username: user.username, id: user.id})
    else
      #error handling
    end
  end


end
