class Workout < ApplicationRecord
    belongs_to :user
    belongs_to :lesson

    validates :name, presence: true
end
