class Category < ApplicationRecord
    has_many :lessons
    has_many :workouts, through: :lessons
    has_many :users, through: :lessons
end
