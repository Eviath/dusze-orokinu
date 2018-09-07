class CreateClans < ActiveRecord::Migration[5.1]
  def change
    create_table :clans do |t|
      t.string :leader
      t.string :name
      t.text :about
      t.integer :members
      t.string :tier
      t.string :logo
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :clans, [:user_id, :created_at]
  end
end
