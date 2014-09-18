class Course < ActiveRecord::Base
  acts_as_votable

  validates_presence_of :name, :url, :description, :level, :date, :instructor, :institution

  # belongs_to :author, class_name: "User"
  belongs_to :user
  has_many :comments

end
