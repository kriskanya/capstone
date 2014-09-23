class Comment < ActiveRecord::Base
  acts_as_votable

  validates_presence_of :comment_text

  belongs_to :user
  belongs_to :course


end
