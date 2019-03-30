class Workout < ActiveRecord::Base
  belongs_to :user

  validates :category, presence: true
end
