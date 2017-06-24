class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.money :rent_limit
      t.money :utilities_limit
      t.money :cell_phone_limit
      t.money :grocery_limit 
      t.money :car_payment_limit
      t.money :food_limit 
      t.money :travel_limit  
      t.money :miscellaneous_limit
    end
  end
end
