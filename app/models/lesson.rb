class Lesson < ApplicationRecord
    belongs_to :user
    has_many :workouts

    validates :name, :date, presence: true
end
