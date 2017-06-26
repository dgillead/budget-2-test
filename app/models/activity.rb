require 'hirb'
require 'pry'

class Activity < ActiveRecord::Base
  belongs_to :budget
  has_many :categories

  class << self
    def new_activity(amount, name, category)
      Activity.create(:amount => amount, :name => name, :category_name => category)
    end

    def list_activities_with_limits
      table = Activity.joins('join categories on activities.category_name=categories.name').select('categories.name as category, sum(amount) as spent, categories.category_limit as limit').group('categories.name, categories.category_limit')
      puts Hirb::Helpers::AutoTable.render(table)
    end

    def list_all_activities
      table = Activity.select('name, amount, created_at as date, category_name as category')
      puts Hirb::Helpers::AutoTable.render(table)
    end

    def total_spent
      Activity.pluck('sum(amount)').first
    end

    def check_limit(category)
      current_spent = Activity.where("category_name = '#{category}'").pluck('sum(amount)').first
      current_limit = Activity.joins('join categories on activities.category_name=categories.name').where("categories.name = '#{category}'").pluck('category_limit').first
      current_spent > current_limit
    end
  end
end
