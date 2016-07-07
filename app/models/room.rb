class Room < ApplicationRecord

  has_many :memberships
  has_many :messages
  has_many :users, through: :memberships

  validates :name, presence: true,
             length: { maximum: 10},
             uniqueness: true
end
