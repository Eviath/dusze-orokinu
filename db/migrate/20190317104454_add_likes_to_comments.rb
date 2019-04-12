class AddLikesToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :like, foreign_key: true
  end
end
