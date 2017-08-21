class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!
  layout "admin"

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @courses = @user.courses
  end

end
