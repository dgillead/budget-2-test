class Activity < ActiveRecord::Base
  belongs_to :budget
  has_many :categories

  class << self
    def new_activity(amount, name, category)
      Activity.create(:amount => amount, :name => name, :category_name => category)
    end
  end
end
