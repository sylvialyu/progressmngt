class Task < ApplicationRecord

  belongs_to :course

  def finish!
    self.completed = true
    self.save
  end

end
