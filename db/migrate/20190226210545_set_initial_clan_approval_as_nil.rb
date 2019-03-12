class SetInitialClanApprovalAsNil < ActiveRecord::Migration[5.2]
  def change
  change_column_default :clans, :approval, nil
  end
end
