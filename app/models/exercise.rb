class Exercise < ActiveRecord::Base
  belongs_to :workout

  def formatted_created_at_time
    self.created_at.strftime("%A, %b %d")
  end

  def formatted_day
    self.created_at.strftime("%A, %b %d")
  end
end
