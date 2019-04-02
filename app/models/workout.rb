class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :exercises
  def formatted_created_at_time
    self.created_at.strftime("%A, %d %b %Y %l:%M %p")
  end
end
