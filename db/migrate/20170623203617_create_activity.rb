class CreateActivity < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.money :amount
      t.string :name
      t.date :date
      t.belongs_to :budget
      t.belongs_to :category
    end
  end
end
