class AppearanceBroadcastJob < ApplicationJob
  queue_as :default

  def perform(membership)
    ActionCable.server.broadcast "appearance_#{membership.room_id}", render_json(membership)
  end

  private

  def render_json(membership)
    member_hash = membership.as_json
    member_hash["username"] = membership.name
    ApplicationController.renderer.render(json: member_hash)
  end

end
