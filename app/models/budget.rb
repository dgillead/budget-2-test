require 'pry'

class Budget < ActiveRecord::Base
  has_many :activities

  class << self
    def check_if_budget_exists
      Budget.count
    end

    def set_budget_limit(limit_amount)
      # binding.pry
      Budget.create(:budget_limit => limit_amount)
    end

    # def change_budget_limit(limit_amount)
    #   @@total_limit = @@total_limit.to_i
    #   @@total_limit -= limit_amount.to_i
    #   # binding.pry
    #   Budget.where('budget_limit IS NOT NULL').update(:budget_limit => @@total_limit)
    # end

    def see_current_limit
      Budget.pluck(:budget_limit)
    end
  end
end
