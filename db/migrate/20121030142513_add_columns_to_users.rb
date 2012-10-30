class AddColumnsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_attachment :users, :avatar
    add_column :users, :date_of_birth, :date
    add_column :users, :sex, :string
    add_column :users, :username, :string, :null => false, :default => ""
    add_index  :users, :username, :unique => true
    add_column :users, :is_admin, :boolean
  end

  def self.down
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_attachment :users
    remove_column :users, :date_of_birth
    remove_column :users, :sex
    remove_column :users, :username
    remove_column :users, :is_admin
  end
end
