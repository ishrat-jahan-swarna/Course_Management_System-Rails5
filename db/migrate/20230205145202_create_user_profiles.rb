class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.integer :current_semester, null: false
      t.string :blood_group, null: false
      t.string :address, null: false
      t.boolean :approved, default: false, null: false
      t.references :department, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
