class Employee < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  belongs_to :department
  has_one :salary
  has_many :leaves
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self
end
