require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'has many deals' do
      association = described_class.reflect_on_association(:deals)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many groups' do
      association = described_class.reflect_on_association(:groups)
      expect(association.macro).to eq(:has_many)
    end
  end
end
