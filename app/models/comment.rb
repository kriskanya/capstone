class Comment < ActiveRecord::Base

  validates_presence_of :comment_text

  belongs_to :user
  belongs_to :course


end
