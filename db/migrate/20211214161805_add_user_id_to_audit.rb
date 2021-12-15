class AddUserIdToAudit < ActiveRecord::Migration[5.2]
  def change
    add_column :audits, :user_id, :integer
  end
end
