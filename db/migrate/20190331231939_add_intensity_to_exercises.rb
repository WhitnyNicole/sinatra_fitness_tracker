class AddIntensityToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :intensity, :string
  end
end
