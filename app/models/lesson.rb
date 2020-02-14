class Lesson < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :workouts

    validates :name, :date, presence: true

    def category_attributes=(attr)
        self.category = Category.find_or_create_by(attr) if !attr[:name].blank?
    end
end
