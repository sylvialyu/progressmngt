class Admin::TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!

  def index
    @course = Course.find(params[:course_id])
    @tasks = Task.all
  end

  def new
    @course = Course.find(params[:course_id])
    @task = Task.new
  end

  def create
    @course = Course.find(params[:course_id])
    @task = Task.new(task_params)
    @task.course = @course
    if @task.save
      redirect_to admin_course_tasks_path(@course)
      flash[:notice] = "Task created!"
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:course_id])
    @task = Task.find(params[:id])
  end

  def update
    @course = Course.find(params[:course_id])
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to admin_course_tasks_path(@course)
      flash[:notice] = "Task updated!"
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to admin_course_tasks_path
    flash[:alert] = "Task deleted!"
  end


  private

  def task_params
    params.require(:task).permit(:content, :completed)
  end


end
