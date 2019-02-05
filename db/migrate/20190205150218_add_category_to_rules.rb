class AddCategoryToRules < ActiveRecord::Migration[5.2]
  def change
    add_reference :rules, :rule_category, foreign_key: true
  end
end
