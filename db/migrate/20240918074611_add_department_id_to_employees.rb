class AddDepartmentIdToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_reference :employees, :department, foreign_key: true
  end
end
