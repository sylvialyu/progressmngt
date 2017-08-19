class TasksController < ApplicationController

  def finish
    @course = Course.find(params[:course_id])
    @task = Task.find(params[:id])
    @task.course = @course
    @task.finish!
    redirect_to :back
  end

  def unfinish
    @course = Course.find(params[:course_id])
    @task = Task.find(params[:id])
    @task.course = @course
    @task.unfinish!
    redirect_to :back
  end

end
