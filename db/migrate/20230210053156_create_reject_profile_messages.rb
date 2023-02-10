class CreateRejectProfileMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :reject_profile_messages do |t|
      t.references :user, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
