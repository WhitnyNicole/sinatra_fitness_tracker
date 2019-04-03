class AddDurationToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :duration, :integer
  end
end
