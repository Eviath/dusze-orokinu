class AddTitleToPrinciples < ActiveRecord::Migration[5.2]
  def change
    add_column :principles, :title, :string
  end
end
