class CompletesController < ApplicationController
  before_action :authenticate_user!

  def finish
    @course = Course.find(params[:course_id])
    @complete.task = Task.find(params[:task_id])
    @complete.user = current_user
    @complete = true
    @complete.save!
    redirect_to :back
  end

end
