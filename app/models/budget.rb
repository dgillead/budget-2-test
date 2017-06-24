require 'pry'

class Budget < ActiveRecord::Base
  has_many :activities

  class << self
    def set_budget_limit(limit_amount)
      Budget.create(:budget_limit => limit_amount)
    end

    def change_budget_limit(limit_amount)
      Budget.update(:budget_limit => limit_amount)
    end

    def see_current_limit
      Budget.pluck(:budget_limit)
    end
  end
end
