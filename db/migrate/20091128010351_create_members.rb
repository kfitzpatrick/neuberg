class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :name
      t.string :email
      t.text :billing_notes

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
