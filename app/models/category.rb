require 'pry'

class Category < ActiveRecord::Base
  has_many :activities

  class << self
    def set_limit(limit_category, limit_amount)
      Category.create(:name => limit_category, :category_limit => limit_amount)
    end

    def update_limit(limit_category, limit_amount)
      Category.where("name = '#{limit_category}'").update(:category_limit => limit_amount)
    end

    def see_limits
      table = Category.select('name, category_limit as limit')
      puts Hirb::Helpers::AutoTable.render(table)
    end

    def check_if_category(limit_category)
      Category.exists?(:name => limit_category)
    end
  end
end
