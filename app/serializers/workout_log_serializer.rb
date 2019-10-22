class WorkoutLogSerializer < ActiveModel::Serializer
  attributes :id, :routine, :sets, :reps, :time_spent
  has_one :user
end
