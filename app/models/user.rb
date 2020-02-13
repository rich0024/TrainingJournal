class User < ApplicationRecord
    has_many :lessons
    has_many :workouts, through: :lessons

    has_secure_password

    validates :username, :email, presence: true
    
end
