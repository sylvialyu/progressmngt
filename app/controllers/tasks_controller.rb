class TasksController < ApplicationController

  def finish
    @course = Course.find(params[:course_id])
    @task = Task.find(params[:id])
    @task.finish!
    redirect_to :back
  end

end
