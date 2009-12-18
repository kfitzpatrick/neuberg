class AddDormantToMember < ActiveRecord::Migration
  def self.up
    add_column :members, :dormant, :boolean, :null => false, :default => false
  end

  def self.down
    remove_column :members, :dormant
  end
end
