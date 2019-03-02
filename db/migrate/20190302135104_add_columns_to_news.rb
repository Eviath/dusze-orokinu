class AddColumnsToNews < ActiveRecord::Migration[5.2]
  def change
    add_column :news, :news_category_id, :string
  end
end
