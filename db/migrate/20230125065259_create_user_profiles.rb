class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.integer :current_semester
      t.string :blood_group
      t.string :address
      t.references :department, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
