class CoursesController < ApplicationController
  # do a course lookup based on the id
  before_action :ensure_user_owns_course, only: [:edit, :destroy]

  def index
    @courses = Course.all
    # truncate_course_description
    # the following is a ruby sort method - http://www.ruby-doc.org/core-2.1.2/Array.html#method-i-sort
    @courses = @courses.sort { |value1, value2| value2.get_likes.size <=> value1.get_likes.size }
    @courses = @courses.paginate(page: params[:page], per_page: 2)
  end

  def new
    @course = Course.new
  end

  def create
    # @course = Course.new(course_params)
    # @comment = @course.comments.build(comment_params)  # creates comment and associates it with the course automatically
    @course = current_user.courses.build(course_params)
    if @course.save
      redirect_to course_comments_path(@course), notice: "#{@course.name} has been posted"
    else
      flash.now[:alert] = "Course could not be posted"
      render :new
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to course_comments_path(@course), notice: "Course #{@course.name} has been updated."
    else
      flash.now[:alert] = "Your changes could not be saved."
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy!
    flash.notice = "Your course has been deleted."
    redirect_to root_path
  end

  def description
    @course = Course.find(params[:id])
    hash = {description: @course.description}
    respond_to do |format|
      format.json { render json: hash }
    end
  end

  # -----acts_as_votable methods-----
  # source: http://stackoverflow.com/questions/15012276/acts-as-votable-thumbs-up-down-buttons

  def upvote
    @course = Course.find(params[:id])
    @course.liked_by current_user
    redirect_to root_path
  end

  def downvote
    @course = Course.find(params[:id])
    @course.downvote_from current_user
    redirect_to root_path
  end

  protected

  def course_params
    params.require(:course).permit(:name, :url, :description, :level, :date, :cost, :instructor, :institution, :duration, :tags)
  end

  def ensure_user_owns_course
    @course = Course.find(params[:id])
    unless @course.user == current_user
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end

  # def truncate_course_description
  #   @courses = Course.all
  #   @courses.each do |course|
  #     if course.description.length > 300
  #       course.description = course.description[0...300] + "..."
  #     end
  #   end
  # end

end
