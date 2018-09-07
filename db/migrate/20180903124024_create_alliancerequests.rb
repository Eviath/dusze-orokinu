class CreateAlliancerequests < ActiveRecord::Migration[5.1]
  def change
    create_table :alliancerequests do |t|
      t.string :nickname
      t.string :lider_nickname
      t.string :clan_name
      t.integer :clan_members
      t.string :clan_tier
      t.text :clan_about
      t.boolean :discord_check, default: false
      t.boolean :rules_check, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :alliancerequests, [:user_id, :created_at]
  end
end
