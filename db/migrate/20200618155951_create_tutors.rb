class CreateTutors < ActiveRecord::Migration[6.0]
  def change
    create_table :tutors do |t|
      t.string :name, null: false
      t.string :identification, null: false
      t.string :email, null: false
      t.string :phone, null: false

      t.timestamps
    end
  end
end
