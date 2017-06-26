require 'faker'
require_relative '../app/models/activity'
require_relative '../app/models/budget'
require_relative '../app/models/category'

Budget.create(:budget_limit => 4000)

10.times do
  Activity.create(:amount => rand(0..100), :name => Faker::Food.ingredient, :category_name => 'food')
  Activity.create(:amount => rand(0..100), :name => Faker::Address.city, :category_name => 'travel')
  Activity.create(:amount => rand(0..100), :name => Faker::Space.galaxy, :category_name => 'misc')
end

Category.create(:name => 'food', :category_limit => 1000)
Category.create(:name => 'travel', :category_limit => 1000)
Category.create(:name => 'misc', :category_limit => 1000)
