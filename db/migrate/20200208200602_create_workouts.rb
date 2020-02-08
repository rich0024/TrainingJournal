class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.string :name
      t.string :type
      t.string :duration
      t.integer :set
      t.integer :rep
      t.string :details
      t.belongs_to :user
      t.belongs_to :lesson

      t.timestamps
    end
  end
end
