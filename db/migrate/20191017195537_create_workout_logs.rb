class CreateWorkoutLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :workout_logs do |t|
      t.string :routine
      t.integer :sets
      t.integer :reps
      t.integer :time_spent
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
