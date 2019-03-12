class AddLastEditDescToNews < ActiveRecord::Migration[5.2]
  def change
    add_column :news, :last_edit_desc, :text
  end
end
