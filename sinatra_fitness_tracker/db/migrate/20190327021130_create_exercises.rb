class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.integer :reps
      t.integer :weight
      t.string :day
      t.integer :workout_id
      t.timestamps null: false
    end
  end
end
