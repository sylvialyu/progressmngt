module ApplicationHelper

  def render_user_name(user_id)
    if user_id == 4
      "Lisa"
    elsif user_id == 5
      "Diana"
    else
      "Sylvia"
    end
  end

end
