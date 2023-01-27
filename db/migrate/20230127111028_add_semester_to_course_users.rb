class AddSemesterToCourseUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :course_users, :semester, :integer, default: 1
  end
end
