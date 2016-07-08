class Room < ApplicationRecord

  has_many :memberships
  has_many :messages
  has_many :users, through: :memberships

  validates :name, presence: true,
             length: { maximum: 16},
             uniqueness: true, :case_sensitive => false
end
