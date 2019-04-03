class AddMoveToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :move, :string
  end
end
