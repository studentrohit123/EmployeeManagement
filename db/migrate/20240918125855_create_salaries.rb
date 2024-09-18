class CreateSalaries < ActiveRecord::Migration[7.1]
  def change
    create_table :salaries do |t|
      t.decimal :basic_salary
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
