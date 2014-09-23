class CommentsController < ApplicationController
  before_action :course_lookup # looks up the course
  before_action :ensure_user_owns_comment, only: [:edit, :destroy]  # checks to make sure only the user can edit a comment

  def index
    @comments = @course.comments
    @comments = @comments.sort { |value1, value2| value2.get_likes.size <=> value1.get_likes.size }

    @comment = Comment.new
  end

  def create
    @comment = @course.comments.build(comment_params)  # creates comment and associates it with the course automatically
    @comment.user = current_user
    if @comment.save
      redirect_to course_comments_path(params[:course_id]), notice: "Comment has been posted."
    else
      flash.now[:alert] = "Comment could not be posted."
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

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
    flash.notice = "Your comment has been successfully deleted."
    redirect_to course_comments_path(@course)
  end

  # -----acts_as_votable methods-----
  # source: http://stackoverflow.com/questions/15012276/acts-as-votable-thumbs-up-down-buttons

  def upvote
    @comment = Comment.find(params[:id])
    @comment.liked_by current_user
    redirect_to course_comments_path(@course)
  end

  def downvote
    @comment = Comment.find(params[:id])
    @comment.downvote_from current_user
    redirect_to course_comments_path(@course)
  end

  protected

  def comment_params
    params.require(:comment).permit(:comment_text)
  end

  def course_lookup
    @course = Course.find(params[:course_id])
  end

  def ensure_user_owns_comment
    @comment = Comment.find(params[:id])
    unless @comment.user == current_user
      redirect_to course_comments_path(@course), alert: "You are not authorized to access this page."
    end
  end

  # def index
  #   have a link where you're passing a course ID, find that course, once you have the course
  #   @course = Course.find(:params)
  #   @comments = @course.comments
  #
  #   this comments resource is nested in Course, so you can access all the comments like the above
  # end
end
