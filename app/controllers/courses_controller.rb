class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to course_path(@course), notice: "#{@course.name} has been posted"
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
      redirect_to course_path(@course), notice: "Course #{@course.name} has been updated."
    else
      flash.now[:alert] = "Your changes could not be saved."
      render :edit
    end
  end

  protected

  def course_params
    params.require(:course).permit(:name, :url, :description, :level, :date, :cost, :instructor, :institution, :duration)
  end
end
