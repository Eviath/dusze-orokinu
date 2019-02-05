class CreatePrinciples < ActiveRecord::Migration[5.2]
  def change
    create_table :principles do |t|
      t.timestamps
    end
  end
end
