class CoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    @courses = current_user.courses
  end

  def show
    @course = current_user.courses.find(params[:id])
    @tasks = @course.tasks
  end


end
