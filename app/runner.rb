require_relative "../config/app"
require_relative '../app/models/budget.rb'
end_input = false

# class Runner
  # write your runner code here
  p "Please enter initial balance"
  set_budget = gets.chomp
  Budget.set_budget_limit(set_budget)

  p "Please select from the following actions:\n CL - Set/modify category budget limit,\n CBI - Category Balance Inquiry,\n TBI Total Balance Inquiry,\n SUM - Statement Summary\nX - EXIT."
  selected_activity = gets.chomp

  until end_input = true
  if selected_activity = CL
  #set/update category limit
  elsif selected_activity = CBI
  #display balance  for selected category
  elsif selected_activity = TBI 
  #display total balance
  elsif selected_activity = SUM
  #display statement summary 
  elsif selected_activity = X
    p "Thank you. Have a good day."
    end_input = true
    return
  else
  "Please select from one of the the following options: CL, CBI, TBI, SUM"
end

  # p 'What would you like to set your budget to?'
  # set_budget = gets.chomp
  # Budget.set_budget_limit(set_budget)
  # p 'The current limit is:'
  # current_limit = Budget.see_current_limit
  # puts current_limit
# end
