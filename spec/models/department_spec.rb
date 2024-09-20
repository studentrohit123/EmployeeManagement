require 'rails_helper'

RSpec.describe Department, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:employees) }
  end
end
