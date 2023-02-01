class AddApprovedToUserProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :approved, :boolean, default: false, null: false
  end
end
