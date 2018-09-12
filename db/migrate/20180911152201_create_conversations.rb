class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.integer :author_id
      t.integer :receiver_id
      t.boolean :author_deleted, default: false
      t.boolean :receiver_deleted, default: false
      t.timestamps
    end
    add_index :conversations, :author_id
    add_index :conversations, :receiver_id
    add_index :conversations, [:author_id, :receiver_id], unique: true
  end
end
