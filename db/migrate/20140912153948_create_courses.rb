class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :url
      t.string :description
      t.string :level
      t.datetime :date
      t.integer :cost
      t.string :instructor
      t.string :institution
      t.string :duration

      t.timestamps
    end
  end
end
