class Admin::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!
  layout "admin"

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
    @tasks = @course.tasks
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user
    @tasks = @course.tasks

    if @course.save
      redirect_to admin_user_path(@course.user), notice: "Course created!"
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
    @course.user = current_user
    @tasks = @course.tasks

    if @course.update(course_params)
      redirect_to admin_user_path(@course.user), notice: "Course updated!"
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to admin_user_path(@course.user), alert: "Course deleted!"
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :image, :user_id)
  end

end
