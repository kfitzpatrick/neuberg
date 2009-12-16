class AddPrimaryIndustryToMember < ActiveRecord::Migration
  def self.up
    add_column :members, :primary_industry, :string
  end

  def self.down
    remove_column :members, :primary_industry
  end
end
