class AddOptionToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :option, :string, default: "mandatory"
  end
end
