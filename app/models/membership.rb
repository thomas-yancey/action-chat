class Membership < ApplicationRecord

  belongs_to :user
  belongs_to :room

  validates_presence_of :room_id
  validates_presence_of :user_id
  validates_uniqueness_of :user_id, :scope => :room_id

  def name
    User.find(self.user_id).username
  end

end
