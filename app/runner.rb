require 'io/console'
require_relative '../config/app'
require_relative '../app/models/budget.rb'
require_relative '../app/models/category.rb'
require_relative '../app/models/activity.rb'

continue = 'y'
if Budget.check_if_budget_exists == 0
	puts 'Enter initial budget limit:'
	initial = gets.chomp
	Budget.set_budget_limit(initial)
	puts 'Would you like to continue? (Y/N)'
	continue = gets.chomp
elsif continue.downcase == 'y' || Budget.check_if_budget_exists != 0
	until continue.downcase == 'n'
    if Budget.check_if_over_limit
      puts "HEY! You are over your current monthly budget limit! You have spent: #{Activity.total_spent} and your limit is: #{Budget.see_current_limit}. You should probably stop buying stuff."
    end
  	puts "Would you like to see your current budget limit, see how much you have spent, change the current budget limit, modify or see category limits, or modify or see transactions? \n
      - limit \n
      - change \n
      - category \n
      - spent \n
      - transaction"
  	response = gets.chomp
  	if response.downcase == 'limit'
  		puts "Current budget limit: $#{Budget.see_current_limit}."
    elsif response.downcase == 'spent'
      puts "You have spent: $#{Activity.total_spent}."
  	elsif response == 'change'
  		puts 'Enter the updated budget limit: '
  		updated_limit = gets.chomp
  		Budget.change_budget_limit(updated_limit)
  		puts "Budget limit has been updated to #{updated_limit}."
  	elsif response == 'category'
  		puts "Would you like to see the current limits for your categories, update a limit for a category, or set an initial limit for a category? \n
          - see \n
          - update \n
          - initial"
  		category_update = gets.chomp
  		if category_update.downcase == 'see'
  			puts Category.see_limits
  		elsif category_update.downcase == 'update'
  			puts 'Which category would you like to update?'
  			category_choice = gets.chomp
  			puts 'What would you like to update the limit to?'
  			category_limit = gets.chomp
  			if !Category.check_if_category(category_choice)
  				puts "#{category_choice.capitalize} is not a current category, you must add it before you can update it."
  			else
  				Category.update_limit(category_choice, category_limit)
  				puts "#{category_choice.capitalize} has been updated to a limit of #{category_limit}."
  			end
  		elsif category_update.downcase == 'initial'
  			puts 'Which category would you like to set?'
  			category_choice = gets.chomp
  			puts 'What would you like to set the limit to?'
  			category_limit = gets.chomp
  			Category.set_limit(category_choice, category_limit)
  			puts "#{category_choice.capitalize} has been created with a limit of #{category_limit}."
  		end
  	elsif response == 'transaction'
  		puts "Would you like to see all transactions, see how much you have spent in each category, or add a new transaction? \n
          - all \n
          - categories \n
          - add "
  		response_transaction = gets.chomp
  		if response_transaction.downcase == 'all'
  			Activity.list_all_activities
  		elsif response_transaction.downcase == 'categories'
  			Activity.list_activities_with_limits
  		elsif response_transaction.downcase == 'add'
  			puts 'Please enter the amount of the transaction:'
  			transaction_amount = gets.chomp
  			puts 'Please enter the name of the transaction:'
  			transaction_name = gets.chomp
  			puts 'Please enter the category of the transaction'
  			transaction_category = gets.chomp
  			if !Category.check_if_category(transaction_category)
  				puts 'This category does not yet exist and has no limit. Would you like to create it and set a limit? (Y/N)'
  				create = gets.chomp
  				if create.downcase == 'y'
  					puts "What would you like to set the limit for #{transaction_category} to?"
  					new_limit = gets.chomp
  					Category.set_limit(transaction_category, new_limit)
  					puts "#{transaction_category} has been saved with a limit of #{new_limit}."
  					puts 'Would you like to continue saving the current transaction? (Y/N)'
  					response = gets.chomp
  					if response.downcase == 'n'
  						puts 'Transaction not saved.'
  					else
              Activity.new_activity(transaction_amount, transaction_name, transaction_category)
              puts "#{transaction_name.capitalize} has been saved under #{transaction_category} with an amount of #{transaction_amount}."
              if Activity.check_limit(transaction_category)
        				puts "You are over your monthly limit for #{transaction_category}!"
        				puts 'Would you like to see your current category limits and how much you have spent? (Y/N)'
        				see_all_limits = gets.chomp
        				if see_all_limits.downcase == 'y'
        					Activity.list_activities_with_limits
        				end
        			end
            end
  				end
  			end
  		end
  	end
  	puts 'Would you like to continue? (Y/N)'
  	continue = gets.chomp
  end
end
