class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_admin!
    unless current_user.is_admin?
      flash[:alert] = "You are not admin!"
      redirect_to root_path
    end
  end

end
