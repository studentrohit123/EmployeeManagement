
class Employee::RegistrationsController < Devise::RegistrationsController
  include RackSessionsFix
  Devise::RegistrationsController
  respond_to :json
  private

  def respond_with(current_employee, _opts = {})
  
    if resource.persisted?
      render json: {
        status: {code: 200, message: 'Signed up successfully.'},
        data: EmployeeSerializer.new(current_employee).serializable_hash[:data][:attributes]
      }
    else
      render json: {
        status: {message: "Employee couldn't be created successfully. #{current_employee.errors.full_messages.to_sentence}"}
      }, status: :unprocessable_entity
    end
  end
end
