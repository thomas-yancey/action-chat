class RoomsController < ApplicationController
  before_action :verify_logged_in

  def show
    @room = Room.find(params[:id])
    redirect_with_flash unless member_of_group

    @messages = @room.messages.order(id: :desc).limit(500).reverse
    @message = Message.new
    @memberships = @room.memberships
  end

  def index
    @rooms = current_user.rooms
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      @room.users << current_user
      redirect_to room_memberships_path(@room)
    else
      flash[:error] = @room.errors.full_messages.to_sentence
      redirect_to rooms_path
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end

end

