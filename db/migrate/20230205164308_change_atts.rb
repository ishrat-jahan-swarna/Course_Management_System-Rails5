class ChangeAtts < ActiveRecord::Migration[5.2]
  def change
    remove_column :course_users, :passed
    add_column :course_users, :result, :integer, default: 0
  end
end
