class CreateMembershipLevels < ActiveRecord::Migration
  def self.up
    create_table :membership_levels do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :membership_levels
  end
end
