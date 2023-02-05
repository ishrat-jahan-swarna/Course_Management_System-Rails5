class AddSemesterToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :semester, :integer, default: 1
  end
end
