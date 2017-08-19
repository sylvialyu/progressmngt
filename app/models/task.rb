class Task < ApplicationRecord

  belongs_to :course

  def finish!
    self.completed = true
    self.save
  end

  def unfinish!
    self.completed = false
    self.save
  end


end
