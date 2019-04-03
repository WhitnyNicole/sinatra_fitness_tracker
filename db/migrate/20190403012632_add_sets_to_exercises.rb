class AddSetsToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :sets, :integer
  end
end
