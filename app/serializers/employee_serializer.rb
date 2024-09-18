class EmployeeSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name, :department_id
end
