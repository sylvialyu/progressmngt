class Admin::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
    @tasks = @course.tasks
  end

  def create
    @course = Course.new(course_params)
    @tasks = @course.tasks

    if @course.save
      redirect_to admin_courses_path, notice: "Course created!"
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
    @tasks = @course.tasks
  end

  def update
    @course = Course.find(params[:id])
    @tasks = @course.tasks

    if @course.update(course_params)
      redirect_to admin_courses_path, notice: "Course updated!"
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to admin_courses_path, alert: "Course deleted!"
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :image)
  end

end
