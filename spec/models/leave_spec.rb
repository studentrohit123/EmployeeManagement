require 'rails_helper'

RSpec.describe Leave, type: :model do
  describe 'associations' do
    it { should belong_to(:employee) }
  end
end
