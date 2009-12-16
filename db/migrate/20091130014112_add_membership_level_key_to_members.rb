class AddMembershipLevelKeyToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :membership_level_id, :integer
  end

  def self.down
    remove_column :members, :membership_level_id
  end
end
