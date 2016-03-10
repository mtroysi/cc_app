class AddMoreBooksToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :moreBooks, :boolean
  end

  def self.down
    remove_column :users, :moreBooks
  end
end
