class Course < ActiveRecord::Base
  acts_as_votable

  validates_presence_of :name, :url, :description, :level, :date, :instructor, :institution

  # validates_url_format_of gem: https://rubygems.org/gems/validates_url_format_of
  validates_url_format_of :url,
                          :allow_nil => false,
                          :message => "must be formatted correctly"

  # belongs_to :author, class_name: "User"
  belongs_to :user
  has_many :comments

  def tag_array
    if self.tags
      self.tags.split(",").map { |tag| tag.lstrip.rstrip }
    end
  end

end
