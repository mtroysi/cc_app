class RemoveMoreBooksFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :moreBooks
  end

  def self.down
    add_column :users, :moreBooks, :boolean
  end
end
