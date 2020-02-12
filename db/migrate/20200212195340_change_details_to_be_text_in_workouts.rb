class ChangeDetailsToBeTextInWorkouts < ActiveRecord::Migration[5.2]
  def change
    change_column :workouts, :details, :text
  end
end
