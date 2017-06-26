# Budgeting Part 2

Do you remember when we created a budgeting terminal-based program with the capability to save stuff to a CSV? We're going to continue building that app out with persisting data to a PostgreSQL database and through using real ActiveRecord.

If you haven't started the challenge, that's okay! Let's start today with your pair.

## TODO
* Allow user to search transactions by date.
* Allow user to display last N transactions.
* Figure out how to remove blank ID column from hirb display.
* Add validations.
* Allow user to remove transactions.
* Make it easier for user to exit program. 

## Backstory
Your instructor, Jon, has a tough time with managing his money. He's been told to create a budget in Excel, but the thought of using spreadsheets makes him very unhappy. He's tasked you with creating a terminal based budgeting application so that he can keep track of his expenses.

Please note that we are going to expound on this project into a web-based application later in the course when we get to Sinatra and Rails.

### What skills does this solidify?
* Reading/writing to Database
* Using ActiveRecord to query a DB
* Single responsibility classes / small methods
* Having Ruby objects talk to one another
* TDD / RSPEC

### Release 0
Think through the classes you'll need to write this app. This is an open-ended challenge, but some possibilities may include: budget, transaction, budget category, etc. Create and migrate your database!

### Release 1
Your favorite: TDD. Work with your pair to figure out what a user can do through the command line. How will he/she enter new transactions? How will someone's budget be saved? How will transactions be saved? How will transactions be categorized and saved so that he/she knows how much is left in a particular category? How will a user exit the program? Calling the program through `app/runner.rb` should start your program.

For the purposes of our challenge, do not have user authentication. Figure that a user is only going to have budgeting program on his/her computer.

### Release 2
Start coding your app. Due to the fact that you have written tests, you'll have a general idea of where you should start!
