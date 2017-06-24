class Activity < ActiveRecord::Base
  belongs_to :budget
  has_many :categories
end
