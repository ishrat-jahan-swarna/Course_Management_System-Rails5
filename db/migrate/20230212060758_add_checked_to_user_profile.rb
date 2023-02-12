class AddCheckedToUserProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :checked, :boolean, default: "false"
  end
end
