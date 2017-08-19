class TasksController < ApplicationController

  before_action :authenticate_user!

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
    @task.user = current_user

    if @task.save
      redirect_to course_path(@course)
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
    @task.course = @course
    @task.user = current_user

    if @task.update(task_params)
      redirect_to course_path(@course)
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to course_path(@course)
  end


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


  private

  def task_params
    params.require(:task).permit(:content, :completed)
  end


end
