# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    member = Membership.where(user_id: current_user.id, room_id: params[:room]).first
    return unless member
    member.is_online
    stream_from "appearance_#{params[:room]}"
  end

  def unsubscribed
    member = Membership.where(user_id: current_user.id, room_id: params[:room]).first
    return unless member
    member.is_offline
  end
end
