class CreateStreamers < ActiveRecord::Migration[5.2]
  def change
    create_table :streamers do |t|
      t.string :name

      t.timestamps
    end
  end
end
