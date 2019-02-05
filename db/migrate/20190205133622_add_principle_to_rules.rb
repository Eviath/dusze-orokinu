class AddPrincipleToRules < ActiveRecord::Migration[5.2]
  def change
    add_reference :rules, :principle, foreign_key: true
  end
end
