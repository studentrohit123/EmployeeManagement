require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'associations' do
    it { should belong_to(:department) }
    it { should have_one(:salary) }
    # it { should have_many(:leaves) }
  end
end
