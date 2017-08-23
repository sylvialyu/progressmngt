module TasksHelper

  def render_task_complete(task)
    if task.completed?
      "Yes"
    else
      "No"
    end
  end

end
