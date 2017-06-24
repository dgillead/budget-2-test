require_relative "../config/app"

class Runner
  # write your runner code here
  p 'What would you like to set your budget to?'
  set_budget = gets.chomp
  Budget.set_budget_limit(set_budget)
  p 'The current limit is: '
  p Budget.see_current_limit
end
