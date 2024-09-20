require 'rails_helper'

RSpec.describe Salary, type: :model do
  describe 'associations' do
    it { should belong_to(:employee) }
  end
end
