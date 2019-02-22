class AddRecruitmentStatusToClans < ActiveRecord::Migration[5.2]
  def change
    add_column :clans, :recruitment_status, :boolean, default: true
  end
end
