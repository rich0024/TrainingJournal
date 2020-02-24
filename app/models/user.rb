class User < ApplicationRecord
    has_many :lessons
    has_many :workouts, through: :lessons
    has_many :categories, through: :lessons

    has_secure_password

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
    
end
