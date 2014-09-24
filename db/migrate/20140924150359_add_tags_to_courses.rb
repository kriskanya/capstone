class AddTagsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :tags, :text
  end
end
