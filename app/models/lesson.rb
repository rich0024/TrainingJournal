class Lesson < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :workouts

    validates :name, :date, presence: true

    def category_attributes=(attr)
        self.category = Category.find_or_create_by(attr) if !attr[:name].blank?
    end

    def self.january
        where('date between ? and ?', "2020-01-01", "2020-01-31")
    end

    def self.february
        where('date between ? and ?', "2020-02-01", "2020-02-31")
    end

    def self.march
        where('date between ? and ?', "2020-03-01", "2020-03-31")
    end

    def self.april
        where('date between ? and ?', "2020-04-01", "2020-04-31")
    end

    def self.may
        where('date between ? and ?', "2020-05-01", "2020-05-31")
    end

    def self.june
        where('date between ? and ?', "2020-06-01", "2020-06-31")
    end

    def self.july
        where('date between ? and ?', "2020-07-01", "2020-07-31")
    end

    def self.august
        where('date between ? and ?', "2020-08-01", "2020-08-31")
    end

    def self.september
        where('date between ? and ?', "2020-09-01", "2020-09-31")
    end

    def self.october
        where('date between ? and ?', "2020-10-01", "2020-10-31")
    end

    def self.november
        where('date between ? and ?', "2020-11-01", "2020-11-31")
    end

    def self.december
        where('date between ? and ?', "2020-12-01", "2020-12-31")
    end
end
