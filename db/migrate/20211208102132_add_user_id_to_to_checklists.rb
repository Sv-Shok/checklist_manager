class AddUserIdToToChecklists < ActiveRecord::Migration[5.2]
  def change
    add_column :checklists, :user_id, :integer
  end
end
