class Course < ActiveRecord::Base

  validates_presence_of :name, :url, :description, :level, :date, :instructor, :institution

end
