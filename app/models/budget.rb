require 'pry'
require_relative 'activity'

class Budget < ActiveRecord::Base
  has_many :activities

  class << self
    def check_if_budget_exists
      Budget.count
    end

    def set_budget_limit(limit_amount)
      Budget.create(:budget_limit => limit_amount)
    end

    def change_budget_limit(limit_amount)
      Budget.where('budget_limit IS NOT NULL').update(:budget_limit => limit_amount)
    end

    def see_current_limit
      Budget.pluck(:budget_limit).first
    end

    def check_if_over_limit
      Budget.pluck(:budget_limit).first < Activity.total_spent
    end
  end
end
