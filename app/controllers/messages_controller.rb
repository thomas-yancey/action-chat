class MessagesController < ApplicationController
  before_action :verify_logged_in

  def create
    @message = Message.new(message_params)
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:room_id, :content).merge(user_id: current_user.id)
  end

end
