class AddOnlineToMembership < ActiveRecord::Migration[5.0]
  def change
    add_column :memberships, :online, :boolean, default: :false
  end
end
