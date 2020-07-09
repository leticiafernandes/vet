class AddTutorToAnimals < ActiveRecord::Migration[6.0]
  def change
    add_reference :animals, :tutor
  end
end
