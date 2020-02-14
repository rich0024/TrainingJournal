class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :name
      t.date :date
      t.belongs_to :user
      t.belongs_to :category

      t.timestamps
    end
  end
end
