class Category < ApplicationRecord
    has_many :lessons
    has_many :workouts, through: :lessons
end
