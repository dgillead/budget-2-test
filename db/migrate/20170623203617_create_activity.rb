class CreateActivity < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.decimal :amount
      t.string :name
      t.timestamps :date
      t.string :category_name
      t.belongs_to :budget
      t.belongs_to :category
    end
  end
end
