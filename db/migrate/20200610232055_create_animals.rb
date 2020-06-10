class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.string :name, null: false
      t.date :birth, null: false
      t.string :type, null: false
      t.string :breed, null: false

      t.timestamps
    end
  end
end
