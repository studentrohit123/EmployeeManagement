require 'rails_helper'

RSpec.describe Leave, type: :model do
  describe "Rspec for Leave model" do 
  it { should belongs_to(:employee) }
  end
end