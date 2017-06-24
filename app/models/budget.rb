require 'pry'

class Budget < ActiveRecord::Base
  has_many :activities

  def self.set_budget_limit(limit_amount)
    Budget.create(:budget_limit => limit_amount)
  end

  def self.change_budget_limit(limit_amount)
    Budget.update(:budget_limit => limit_amount)
  end

  def self.see_current_limit
    # binding.pry
    Budget.pluck(:budget_limit)
    # binding.pry
  end
end
