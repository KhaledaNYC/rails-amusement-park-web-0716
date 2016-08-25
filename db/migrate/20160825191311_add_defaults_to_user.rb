class AddDefaultsToUser < ActiveRecord::Migration
  def change
    change_column :users, :nausea, :integer, default: 1
    change_column :users, :happiness, :integer, default: 5
    change_column :users, :height, :integer, default: 56
    change_column :users, :tickets, :integer, default: 10
  end
end
