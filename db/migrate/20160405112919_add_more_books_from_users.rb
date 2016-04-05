class AddMoreBooksFromUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :moreBooks, :string
  end

  def self.down
    remove_column :users, :moreBooks
  end
end
