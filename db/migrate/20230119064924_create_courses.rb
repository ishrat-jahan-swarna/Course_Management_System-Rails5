class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :code, null:false
      t.string :title, null:false
      t.text :description
      t.string :prerequisite
      t.decimal :credit, null:false, precision:3, scale:2
      t.integer :days, null:false

      t.timestamps
    end
  end
end
