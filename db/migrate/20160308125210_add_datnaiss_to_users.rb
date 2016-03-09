class AddDatnaissToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :datnaiss, :date
  end

  def self.down
    remove_column :users, :datnaiss
  end
end
