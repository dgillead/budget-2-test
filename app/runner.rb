require_relative "../config/app"
require_relative '../app/models/budget.rb'
require_relative '../app/models/category.rb'
require_relative '../app/models/activity.rb'

continue = 'y'
if Budget.check_if_budget_exists == 0
    puts 'Enter initial limit:'
    initial = gets.chomp
    Budget.set_budget_limit(initial)
    puts 'Would you like to continue? (Y/N)'
    continue = gets.chomp
  elsif continue.downcase == 'y' || Budget.check_if_budget_exists != 0
      until continue.downcase == 'n'
        puts 'Would you like to see your current budget limit, change the current budget limit, modify or see category limits, or add a new transaction?(see, change, category, transaction)'
        response = gets.chomp
        if response == 'see'
          p 'Current budget limit:'
          puts Budget.see_current_limit
        elsif response == 'change'
          puts 'Enter the updated budget limit: '
          updated_limit = gets.chomp
          Budget.change_budget_limit(updated_limit)
        elsif response == 'category'
          puts 'Would you like to see the current limits for your categories, update a limit for a category, or set an initial limit for a category? (see, update, initial)'
          category_update = gets.chomp
          if category_update == 'see'
            puts Category.see_limits
          elsif category_update == 'update'
            puts 'Which category would you like to update? (rent, utilities, cell, grocery, car, food, travel, miscellaneous)'
            category_choice = gets.chomp
            puts 'What would you like to update the limit to?'
            category_limit = gets.chomp
            Category.update_limit(category_choice, category_limit)
          elsif category_update == 'initial'
            puts 'Which category would you like to set?'
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
              if response.downcase == 'y'
                Activity.new_activity(transaction_amount, transaction_name, transaction_category)
              end
            end
          end
          Activity.new_activity(transaction_amount, transaction_name, transaction_category)
          if Activity.check_limit(transaction_category)
            puts "You are over your monthly limit for #{transaction_category}!"
            puts 'Would you like to see your current category limits and how much you have spent? (Y/N)'
            see_all_limits = gets.chomp
            if see_all_limits.downcase == 'y'
              Activity.list_activities
            end
          end
        end
      end
    end
