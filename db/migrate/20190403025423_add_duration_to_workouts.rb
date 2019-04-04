class AddDurationToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :duration, :integer, default: 30
  end
end
