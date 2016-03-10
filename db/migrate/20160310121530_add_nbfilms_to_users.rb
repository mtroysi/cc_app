class AddNbfilmsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :nbfilms, :integer
  end

  def self.down
    remove_column :users, :nbfilms
  end
end
