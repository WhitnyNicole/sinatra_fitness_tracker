class Exercise < ActiveRecord::Base

  def formatted_created_at_time
    self.created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def formatted_day
    self.created_at.strftime("%A, %b %d")
  end
end
