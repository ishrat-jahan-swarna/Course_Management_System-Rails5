class Create < ActiveRecord::Migration[5.2]
  def change
    create_join_table   :courses, :departments
  end
end
