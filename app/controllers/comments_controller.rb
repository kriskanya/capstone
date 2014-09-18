class CommentsController < ApplicationController
  before_action :course_lookup, only: [:index, :create, :edit, :update, :show] # looks up the course

  def index
    @comments = @course.comments
    @comment = Comment.new
  end

  def create
    @comment = @course.comments.build(comment_params)  # creates comment and associates it with the course automatically
    @comment.user = current_user
    if @comment.save
      redirect_to course_comments_path(params[:course_id]), notice: "Comment has been posted."
    else
      flash.now[:alert] = "Comment could not be posted."
      # render course_comments_path(@course)
      render "index"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to course_comment_path(@course, @comment), notice: "Comment has been updated."
    else
      flash.now[:alert] = "Your changes could not be saved."
      render :edit
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  protected

  def comment_params
    params.require(:comment).permit(:comment_text)
  end

  def course_lookup
    @course = Course.find(params[:course_id])
  end

  # def index
  #   have a link where you're passing a course ID, find that course, once you have the course
  #   @course = Course.find(:params)
  #   @comments = @course.comments
  #
  #   this comments resource is nested in Course, so you can access all the comments like the above
  # end
end
