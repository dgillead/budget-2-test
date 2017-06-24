require_relative "../config/app"
require_relative '../app/models/budget.rb'
require_relative '../app/models/category.rb'
require_relative '../app/models/activity.rb'

# class Runner
  # write your runner code here
if Budget.check_if_budget_exists == 0
    puts 'Enter initial limit:'
    initial = gets.chomp
    Budget.set_budget_limit(initial)
else
  puts 'Would you like to see your current budget limit, change the current budget limit, modify or see category limits, or add a new transaction?(see, change, category, transaction)'
  response = gets.chomp
  if response == 'see'
    puts Budget.see_current_limit
  elsif response == 'change'
    puts 'Enter the updated budget limit: '
    updated_limit = gets.chomp
    Budget.change_budget_limit(updated_limit)
  elsif response == 'category'
    puts 'Would you like to see the current limits for your categories, update a limit for a category, or set an initial limit for a category? (see, update, initial)'
    category_update = gets.chomp
    if category_update == 'see'
      puts 'Which category would you like to see the limit for? (rent, utilities, cell, grocery, car, food, travel, miscellaneous)'
      see_category = gets.chomp
      puts Category.see_limit(see_category)
    elsif category_update == 'update'
      puts 'Which category would you like to update? (rent, utilities, cell, grocery, car, food, travel, miscellaneous)'
      category_choice = gets.chomp
      puts 'What would you like to update the limit to?'
      category_limit = gets.chomp
      Category.update_limit(category_choice, category_limit)
    elsif category_update == 'initial'
      puts 'Which category would you like to set? (rent, utilities, cell, grocery, car, food, travel, miscellaneous)'
      category_choice = gets.chomp
      puts 'What would you like to set the limit to?'
      category_limit = gets.chomp
      Category.set_limit(category_choice, category_limit)
    end
  elsif response == 'transaction'
    puts 'Please enter the amount of the transaction:'
    transaction_amount = gets.chomp
    puts 'Please enter the name of the transaction:'
    transaction_name = gets.chomp
    puts 'Please enter the category of the transaction'
    transaction_category = gets.chomp
    Activity.new_activity(transaction_amount, transaction_name, transaction_category)
    Budget.change_budget_limit(transaction_amount)
  end
end
  # end
  # p 'What would you like to set your budget to?'
  # set_budget = gets.chomp
  # Budget.set_budget_limit(set_budget)
  # p 'The current limit is:'
  # current_limit = Budget.see_current_limit
  # puts current_limit
# end
