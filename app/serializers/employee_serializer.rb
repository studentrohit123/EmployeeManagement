class EmployeeSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name
end
