class AddLiderToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :lider, :boolean, default: false
  end
end
