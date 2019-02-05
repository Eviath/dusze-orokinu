class AddContentToAbout < ActiveRecord::Migration[5.2]
  def change
    add_column :abouts, :content, :text
  end
end
