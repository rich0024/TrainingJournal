class Workout < ApplicationRecord
    belongs_to :user
    belongs_to :lesson
    belongs_to :category

    validates :name, presence: true
end
