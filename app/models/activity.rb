require 'hirb'

class Activity < ActiveRecord::Base
  belongs_to :budget
  has_many :categories

  class << self
    def new_activity(amount, name, category)
      Activity.create(:amount => amount, :name => name, :category_name => category)
    end

    def list_activities
      table = Activity.joins('join categories on activities.category_name=categories.name').select('categories.name as category, sum(amount) as spent, categories.category_limit as limit').group('categories.name, categories.category_limit')
      puts Hirb::Helpers::AutoTable.render(table)
    end
  end
end
