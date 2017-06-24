require 'pry'

class Category < ActiveRecord::Base
  has_many :activities

  class << self
    def set_limit(limit_category, limit_amount)
      limit_category = limit_category.to_sym
      Category.create(limit_category => limit_amount)
    end

    def update_limit(limit_category, limit_amount)
      limit_category = limit_category.to_sym
      Category.update(limit_category => limit_amount)
    end

    def see_limit(limit_category)
      limit_category = limit_category.to_sym
      Category.where("#{limit_category} IS NOT NULL").pluck(limit_category)
    end


  #   def set_rent_limit(limit_amount)
  #     Category.create(:rent_limit => limit_amount)
  #   end
  #
  #   def change_rent_limit(limit_amount)
  #     Category.update(:rent_limit => limit_amount)
  #   end
  #
  #   def set_utilities_limit(limit_amount)
  #     Category.create(:utilities_limit => limit_amount)
  #   end
  #
  #   def change_utilites_limit(limit_amount)
  #     Category.update(:utilities_limit => limit_amount)
  #   end
  #
  #   def set_cell_phone_limit(limit_amount)
  #     Category.create(:cell_phone_limit => limit_amount)
  #   end
  #
  #   def change_cell_phone_limit(limit_amount)
  #     Category.update(:cell_phone_limit => limit_amount)
  #   end
  #
  #   def set_grocery_limit(limit_amount)
  #     Category.create(:grocery_limit => limit_amount)
  #   end
  #
  #   def change_grocery_limit(limit_amount)
  #     Category.update(:grocery_limit => limit_amount)
  #   end
  #
  #   def set_car_payment_limit(limit_amount)
  #     Category.create(:car_payment_limit => limit_amount)
  #   end
  #
  #   def change_car_payment_limit(limit_amount)
  #     Category.update(:car_payment_limit => limit_amount).where('car_payment_limit IS NOT NULL')
  #   end
  #
  #   def set_food_limit(limit_amount)
  #     Category.create(:food_limit => limit_amount)
  #   end
  #
  #   def change_food_limit(limit_amount)
  #     Category.update(:food_limit => limit_amount)
  #   end
  #
  #   def set_travel_limit(limit_amount)
  #     Category.create(:travel_limit => limit_amount)
  #   end
  #
  #   def change_travel_limit(limit_amount)
  #     Category.update(:travel_limit => limit_amount)
  #   end
  #
  #   def set_miscellaneous_limit(limit_amount)
  #     Category.create(:miscellaneous_limit => limit_amount)
  #   end
  #
  #   def change_miscellaneous_limit(limit_amount)
  #     Category.update(:miscellaneous_limit => limit_amount)
  #   end
  end
end
