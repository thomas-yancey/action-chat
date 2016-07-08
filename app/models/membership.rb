class Membership < ApplicationRecord

  belongs_to :user
  belongs_to :room

  validates_presence_of :room_id
  validates_presence_of :user_id
  validates_uniqueness_of :user_id, :scope => :room_id
  after_update_commit {AppearanceBroadcastJob.perform_later self}

  def name
    User.find(self.user_id).username
  end

  def is_online
    self.update_attributes(online: true)
  end

  def is_offline
    self.update_attributes(online: false)
  end

end
