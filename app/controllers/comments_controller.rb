class CommentsController < ApplicationController

  def index
    @course = Course.find(params[:course_id])
    @comments = @course.comments
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.course_id = params[:course_id]
    if @comment.save
      redirect_to course_comments_path(params[:course_id]), notice: "Comment has been posted."
    else
      flash.now[:alert] = "Comment could not be posted."
      # render course_comments_path(@course)
      render :index
      # render :action => 'index'
    end
  end

  protected

  def comment_params
    params.require(:comment).permit(:comment_text, :user_id, :course_id)
  end

  # def index
  #   have a link where you're passing a course ID, find that course, once you have the course
  #   @course = Course.find(:params)
  #   @comments = @course.comments
  #
  #   this comments resource is nested in Course, so you can access all the comments like the above
  # end
end
