module Admin::CoursesHelper

  def render_user_name(user)
    if @course.user.display_name.present?
      @course.user.display_name(user)
    else
      ""
    end
  end

end
