class ChangeAtts < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :semester, :integer, default: 1
    remove_column :course_users, :passed
    add_column :course_users, :result, :integer, default: 0
  end
end
